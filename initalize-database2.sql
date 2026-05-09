-- Load in all cleaned data 
INSTALL spatial;
LOAD spatial;

CREATE TABLE coal_deposits AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/coal_deposites_texas.parquet');

CREATE TABLE generator_energy AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/generator_TX.parquet');

CREATE TABLE ghi AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/ghi_texas.parquet');

CREATE TABLE multifuel_energy AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/multifuel_TX.parquet');

CREATE TABLE plant_energy AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/plant_TX.parquet');

CREATE TABLE solar_energy AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/solar_energy_TX.parquet');

CREATE TABLE ultility_energy AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/utility_TX.parquet');

CREATE TABLE wind_energy AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/wind_energy_TX.parquet');

CREATE TABLE wind AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/wind_texas.parquet');

-- Doesn't like the spatial parquet files. Just download the csvs 
-- CREATE TABLE socio_demo_sf AS 
    -- SELECT * FROM read_csv('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/socio_demo_texas.csv');

CREATE TABLE socio_demo AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/socio_demo_texas.parquet');

CREATE TABLE texas_counties AS 
SELECT *, ST_GeomFromWKB(geometry) AS geometry 
FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/texas_counties_sf.parquet');

CREATE TABLE texas_counties_csv AS 
SELECT *, ST_GeomFromText(geometry) AS geometry 
FROM read_csv('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/texas_counties.csv');

SELECT * FROM parquet_scan('/path/to/texas_counties_sf.parquet') LIMIT 1;
SELECT * FROM parquet_scan('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/tx_energy_grid_database/data/processed/texas_counties_sf.parquet') LIMIT 1;


DROP TABLE IF EXISTS texas_counties;

