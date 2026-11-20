# Script to split AK butterfly checklist table into DwC tables
# by Matt Bowser
# November 19-20, 2026

# Load checklist data.
cl <- read.csv("../archive/checklist.csv", stringsAsFactors = FALSE)

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
 "identificationQualifier",
 "scientificNameAuthorship",
 "kingdom",
 "taxonRank",
 "taxonomicStatus",
 "source") 

# Split tables.
sd <- cl[,colsd]
vn <- cl[,colvn]
tx <- cl[,coltx]

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
names(tx)[which(names(tx) == "source")] <- "references"
