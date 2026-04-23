
-- ENERGY TABLES 

-- Create UTILITY Energy table 
CREATE TABLE utility_texas (
    utility_id INTEGER NOT NULL PRIMARY KEY, 
    utility_name VARCHAR NOT NULL, 
    street_address VARCHAR NOT NULL, 
    city VARCHAR NOT NULL, 
    state VARCHAR NOT NULL,
    zip INTEGER NOT NULL, 
    entity_type VARCHAR NOT NULL
);

-- Fill the UTILITY Energy table  
COPY utility_texas FROM "data/processed/utility_TX.csv" (header TRUE, nullstr "NA");



-- Create GENERATOR Energy table 
CREATE TABLE generator_TX (
    utility_id INTEGER NOT NULL, 
    utility_name VARCHAR NOT NULL, 
    plant_code REAL NOT NULL, 
    plant_name VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    cnty_name VARCHAR NOT NULL, 
    generator_id VARCHAR NOT NULL, 
    technology VARCHAR NOT NULL, 
    prime_mover VARCHAR NOT NULL, 
    ownership VARCHAR, 
    nameplate_capacity_mw REAL NOT NULL, 
    nameplate_power_factor REAL NOT NULL, 
    summer_capacity_mw REAL NOT NULL,
    winter_capacity_mw REAL NOT NULL,
    minimum_load_mw REAL NOT NULL,
    status VARCHAR NOT NULL, 
    operating_month REAL NOT NULL, 
    sector_name VARCHAR NOT NULL, 
    sector INTEGER NOT NULL, 
    energy_source_1 VARCHAR NOT NULL, 
    multiple_fuels CHAR(1) CHECK (multiple_fuels IN ('Y', 'N'))
);

COPY generator_TX FROM "data/processed/generator_TX.csv" (header TRUE, nullstr "NA");


-- Create SOLAR Energy table 
CREATE TABLE solar_energy_TX (
    utility_id INTEGER NOT NULL, 
    utility_name VARCHAR NOT NULL, 
    plant_code REAL NOT NULL, 
    plant_name VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    cnty_name VARCHAR NOT NULL, 
    generator_id VARCHAR NOT NULL, 
    status VARCHAR NOT NULL, 
    technology VARCHAR NOT NULL, 
    prime_mover VARCHAR NOT NULL, 
    sector_name VARCHAR NOT NULL, 
    sector INTEGER NOT NULL, 
    nameplate_capacity_mw REAL NOT NULL, 
    summer_capacity_mw REAL NOT NULL,
    winter_capacity_mw REAL NOT NULL,
    operating_month INTEGER NOT NULL, 
    operating_year INTEGER NOT NULL, 
    dc_net_capacity_mw REAL NOT NULL, 
    net_metering_agreement CHAR(1) NOT NULL CHECK (multiple_fuels IN ('Y', 'N')),
    net_metering_dc_capacity_mw REAL,
    virtural_net_metering_agreement CHAR(1) NOT NULL CHECK (multiple_fuels IN ('Y', 'N')),
    virtual_net_metering_dc_capacity_mw REAL
);

COPY solar_energy_TX FROM "data/processed/solar_energy_TX.csv" (header TRUE, nullstr "NA");


-- Create WIND Energy table 
CREATE TABLE wind_energy_TX (
    utility_id INTEGER NOT NULL, 
    utility_name VARCHAR NOT NULL, 
    plant_code REAL NOT NULL, 
    plant_name VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    cnty_name VARCHAR NOT NULL, 
    generator_id VARCHAR NOT NULL, 
    status VARCHAR NOT NULL, 
    technology VARCHAR NOT NULL, 
    prime_mover VARCHAR NOT NULL, 
    sector_name VARCHAR NOT NULL, 
    sector INTEGER NOT NULL, 
    nameplate_capacity_mw REAL NOT NULL, 
    summer_capacity_mw REAL NOT NULL,
    winter_capacity_mw REAL NOT NULL,
    operating_month INTEGER NOT NULL, 
    operating_year INTEGER NOT NULL, 
    number_of_turbines REAL NOT NULL, 
    design_wind_speed_mph REAL NOT NULL, 
    wind_quality_class REAL, 
    turbine_hub_height_feet REAL NOT NULL CHECK (turbine_hub_height_feet < 0)
);

COPY wind_energy_TX FROM "data/processed/wind_energy_TX.csv" (header TRUE, nullstr "NA");


-- Create STORAGE Energy table 


-- Create MULTIFUEL Energy table 



-- Create a new, empty table 
CREATE TABLE Snow_cover (
    Site VARCHAR NOT NULL,
    Year INTEGER NOT NULL CHECK (Year BETWEEN 1990 AND 2018),
    Date DATE NOT NULL,
    Plot VARCHAR NOT NULL,
    Location VARCHAR NOT NULL,
    Snow_cover REAL CHECK (Snow_cover BETWEEN 0 AND 130),
    Water_cover REAL CHECK (Water_cover BETWEEN 0 AND 130),
    Land_cover REAL CHECK (Land_cover BETWEEN 0 AND 130),
    Total_cover REAL CHECK (Total_cover BETWEEN 0 AND 130),
    Observer VARCHAR,
    Notes VARCHAR,
    PRIMARY KEY (Site, Plot, Location, Date),
    FOREIGN KEY (Site) REFERENCES Site (Code)
);

-- Fill the empty table with the csv 
COPY Snow_cover FROM "../ASDN_csv/snow_survey_fixed.csv" (header TRUE, nullstr "NA");