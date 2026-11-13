# Script to make taxonID values for butterfly records from Philip and Ferris (2026)
# by Matt Bowser
# November 13, 2026

# Load data.
checklistFile <- "../archive/checklist.csv"
checklist <- read.csv(checklistFile, stringsAsFactors = FALSE)

# Make identifiers from preexisting numbers.
slID <- !is.na(checklist$taxonID)
numberString <- substr(as.character(checklist$taxonID[slID] + 100), 2, 3)
checklist$taxonID[slID] <- paste0("PhilipFerris2026species", numberString)

# Save.
write.csv(checklist, checklistFile, row.names = FALSE, na = "")
