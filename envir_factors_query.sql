-- OVERARCHING QUESTION: Do Texas communities optimize their energy generation around local environmental resources, and do socioeconomic and demographic disparities influence how those resources are utilized?


-- QUESTION 1: ENVIR. ALIGNMENT - Do Texas communities leverage local environmental resources in their energy generation mix?

-- Q1.A: Is solar energy adoption associated with solar irradiance levels across Texas communities?
SELECT cnty_name, COUNT(*) AS count ,AVG(nameplate_capacity_mw) AS capacity_avg, AVG(ghi) AS ghi_avg FROM solar_energy AS solar
    JOIN ghi USING(cnty_name)
    GROUP BY cnty_name
    ORDER BY cnty_name;

-- See what turned up NULL - Nothing :) 
SELECT * FROM solar_energy AS solar
    JOIN ghi ON solar.cnty_name = ghi.cnty_name
    WHERE ghi.ghi IS NULL OR solar.nameplate_capacity_mw IS NULL;


-- Q1.B: Is wind energy capacity associated with wind resource availability across Texas communities?
SELECT cnty_name, AVG(wind_100m) AS windspeed_100m_avg, AVG(nameplate_capacity_mw) AS capacity_avg FROM wind_energy
    JOIN wind USING(cnty_name)
    GROUP BY cnty_name
    ORDER BY cnty_name;

-- See what turned up NULL - Nothing :) 
SELECT * FROM wind_energy AS energy
    JOIN wind ON energy.cnty_name = wind.cnty_name
    WHERE wind.wind_100m IS NULL OR energy.nameplate_capacity_mw IS NULL;


-- QUESTION 2: How is energy generation distributed across socioeconomically disadvantaged communities in Texas?

-- Q2.A: How does residential energy source distribution vary across income brackets? 
SELECT cnty_name, 
        AVG(income_avg) AS avg_income, 
        SUM(total_voltage) AS total_voltage, 
        COUNT(*) AS plant_count, 
        AVG(solar.nameplate_capacity_mw) AS solar_avg_capacity_mw,
        AVG(wind.nameplate_capacity_mw) AS wind_avg_capacity_mw
    FROM plant_energy 
    -- Join the other datasets 
    JOIN socio_demo USING (cnty_name)
    JOIN solar_energy AS solar USING (cnty_name)
    JOIN wind_energy AS wind USING (cnty_name)
    GROUP BY cnty_name
    ORDER BY cnty_name;

-- Q2.B: ENERGY & EQUITY - How does energy mix differ across communities with varying levels of educational attainment? 

-- Education level = proxy for income/wealth... prob will drop this research question
SELECT cnty_name, 
        AVG(edu_total) AS edu_total, 
        SUM(total_voltage) AS total_voltage, 
        COUNT(*) AS plant_count, 
        AVG(solar.nameplate_capacity_mw) AS solar_avg_capacity_mw,
        AVG(wind.nameplate_capacity_mw) AS wind_avg_capacity_mw
    FROM plant_energy 
    -- Join the other datasets 
    JOIN socio_demo USING (cnty_name)
    JOIN solar_energy AS solar USING (cnty_name)
    JOIN wind_energy AS wind USING (cnty_name)
    GROUP BY cnty_name
    ORDER BY cnty_name;

-- Q2.C: Is there an association between community poverty rates and reliance on specific energy sources?
SELECT cnty_name, 
        SUM(hh_pov_status_total) AS total_hh_pov, -- total household poverty counts 
        SUM(total_voltage) AS total_voltage, 
        COUNT(*) AS plant_count, 
        AVG(solar.nameplate_capacity_mw) AS solar_avg_capacity_mw,
        AVG(wind.nameplate_capacity_mw) AS wind_avg_capacity_mw
    FROM plant_energy 
    -- Join the other datasets 
    JOIN socio_demo USING (cnty_name)
    JOIN solar_energy AS solar USING (cnty_name)
    JOIN wind_energy AS wind USING (cnty_name)
    GROUP BY cnty_name
    ORDER BY cnty_name;

-- Q2.D: How does energy generation composition vary across communities of different racial and ethnic demographics?
SELECT cnty_name, 
        SUM(white_total) AS white_total,
        SUM(black_aa_total) AS black_aa_total,
        SUM(ai_an_total) AS ai_an_total,
        SUM(asian_total) AS asian_total,
        SUM(ah_pi_total) AS ah_pi_total,
        SUM(other_total) AS other_total,
       -- SUM(plus2_total) AS plus2_total,
        SUM(total_voltage) AS total_voltage, 
        COUNT(*) AS plant_count, 
        AVG(solar.nameplate_capacity_mw) AS solar_avg_capacity_mw,
        AVG(wind.nameplate_capacity_mw) AS wind_avg_capacity_mw
    FROM plant_energy 
    -- Join the other datasets 
    JOIN socio_demo USING (cnty_name)
    JOIN solar_energy AS solar USING (cnty_name)
    JOIN wind_energy AS wind USING (cnty_name)
    GROUP BY cnty_name
    ORDER BY cnty_name;



