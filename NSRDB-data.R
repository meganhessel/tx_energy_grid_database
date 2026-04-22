library(httr)
library(jsonlite)

API_KEY <- Sys.getenv("NSRDB_KEY")

EMAIL <- "meganhessel@ucsb.edu"

url <- "https://developer.nrel.gov/api/nsrdb/v2/solar/nsrdb-GOES-aggregated-v4-0-0-download.json"

response <- POST(
  url = url,
  body = list(
    attributes = "ghi",
    interval = "60",
    names = "2024",
    location_ids = "444561",  # just ONE ID for now
    api_key = API_KEY,
    email = EMAIL
  ),
  encode = "form",
  add_headers(`x-api-key` = API_KEY)
)

res_json <- fromJSON(content(response, "text"))

res_json$outputs$downloadUrl

download.file(res_json$outputs$downloadUrl,
              destfile = "nsrdb_data.zip",
              mode = "wb")

unzip("nsrdb_data.zip")