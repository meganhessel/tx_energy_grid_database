-- QUESTION: Are communities with greater sunshine using solar more? 
SELECT * FROM ghi;
SELECT * FROM solar_energy;


-- QUESTION: Are communities with greater windspeeds using wind turbines more? 
SELECT cnty_name, COUNT(*) AS count ,AVG(nameplate_capacity_mw) AS capacity_avg, AVG(ghi) AS ghi_avg FROM solar_energy AS solar
    JOIN ghi USING(cnty_name)
    GROUP BY cnty_name;


-- See what turned up NULL 
SELECT * FROM solar_energy AS solar
    JOIN ghi ON solar.cnty_name = ghi.cnty_name
    WHERE ghi.ghi IS NULL;

-- QUESTION: Are communities with greater coal deposites using power plants more? 

