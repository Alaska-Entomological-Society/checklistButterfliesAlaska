# Script to split AK butterfly checklist table into DwC tables
# by Matt Bowser
# November 19-20, 2026

# Function to write out csv files in same format as MS Excel.
write.csv.xl <- function(x, con){
con <- file(con, 
            open="wb", 
            encoding="UTF-8")
write.table(
  x, 
  file=con,
  quote=TRUE,
  sep = ",",
  na = "",
  row.names=FALSE,
  fileEncoding="UTF-8",
  eol="\n"
)
close.connection(con)
}

# Load checklist data.
cl <- read.csv("../archive/checklist.csv", stringsAsFactors = FALSE)

# Update some name fields.
cl$canonicalName <- cl$scientificName
cl$scientificName <- paste(cl$scientificName, cl$scientificNameAuthorship, 
 sep = " ")

# Select columns for each table.
colsd <- c("taxonID",
 "scientificName", # Included for ease of maintenance.
 "locationID",
 "countryCode",
 "locality",
 "occurrenceStatus",
 "establishmentMeans",
 "degreeOfEstablishment",
 "source",
 "occurrenceRemarks")
colvn <- c("taxonID",
 "scientificName", # Included for ease of maintenance.
 "vernacularName",
 "source")
coltx <- c("taxonID",
 "scientificName", 
 "parentNameUsageID",
 "identificationQualifier",
 "scientificNameAuthorship",
 "kingdom",
 "phylum",
 "class",
 "order",
 "family",
 "genus",
 "taxonRank",
 "taxonomicStatus") 

# Select only species records.
slsp <- cl$taxonRank %in% c("species", "species complex")

# Split tables.
sd <- cl[slsp, colsd]
vn <- cl[slsp, colvn]
tx <- cl[slsp, coltx]

# Modify vernacular names table.
vn <- vn[which(!vn$vernacularName == ""),]
vnspl <- strsplit(vn$vernacularName, split = "\\|")
vn1 <- vn[,c("taxonID", "scientificName")]
vn1$vernacularName <- lapply(vnspl, "[", 1)
vn2 <- vn[,c("taxonID", "scientificName")]
vn2$vernacularName <- lapply(vnspl, "[", 2)
vn1 <- rbind(vn1, vn2)
vn1$vernacularName <- trimws(vn1$vernacularName)
vn1 <- vn1[!is.na(vn1$vernacularName),]
vn <- merge(x = vn1, y = vn[,which(!names(vn) %in% "vernacularName")], all.x = TRUE)

# Modify taxon table.
tx$rightsHolder <- "Alaska Entomological Society"
tx$license <- "http://creativecommons.org/publicdomain/zero/1.0/legalcode"
tx$references <- "https://www.akentsoc.org/doc/AK_Butterfly_Guide_2026_revision.pdf"
tx$parentNameUsageID <- ""

# Write out.
write.csv.xl(tx, "../archive/taxon.csv")
write.csv.xl(sd, "../archive/speciesDistribution.csv")
write.csv.xl(vn, "../archive/vernacularName.csv")

