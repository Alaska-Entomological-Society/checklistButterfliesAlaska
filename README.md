# Checklist of the Butterflies of Alaska


## About the Checklist

This repository is for maintaining a checklist of the butterflies of
Alaska in Darwin Core format based on the *Butterflies of Alaska*
([Philip and Ferris 2026](#ref-PhilipFerris2026)).

The structure of the checklist follows guidance of GBIF
([2017](#ref-GBIF2017)). The
[`archive/checklist.csv`](archive/checklist.csv) table currently
includes information from the Darwin Core

- taxon (<https://rs.gbif.org/core/dwc_taxon_2025-07-10.xml>),
- species distribution
  (<https://rs.gbif.org/extension/gbif/1.0/distribution_2022-02-02.xml>),
  and
- vernacular names
  (<https://rs.gbif.org/extension/gbif/1.0/vernacularname.xml>)

extensions. Terms and controlled vocabularies generally follow Darwin
Core Maintenance Group ([2026](#ref-DarwinCoreMaintenanceGroup2026)).
The vocabulary of `occurrenceStatus` are available from
<https://rs.gbif.org/vocabulary/gbif/distribution_status_2020-07-15.xml>.
The vocabulary of `establishmentMeans` and `degreeOfEstablishment`
follows Groom et al. ([2019](#ref-Groometal2019)).

## Notes

In addition to the single Alaskan record of *Boloria epithore* (Western
Meadow Fritillary) cited by Philip and Ferris
([2026](#ref-PhilipFerris2026)), a second Alaskan record has been
documented ([<span class="nocase">iNaturalist contributors and
iNaturalist</span> 2026](#ref-iNaturalist2026occurrence5206387618))[^1],
so we considered its `occurrenceStatus` to be `present` and its
`establishmentMeans` to be `native`.

## References

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-DarwinCoreMaintenanceGroup2026" class="csl-entry">

Darwin Core Maintenance Group (2026) Darwin core list of terms.
Biodiversity Information Standards (TDWG). Available from:
<http://rs.tdwg.org/dwc/doc/list/2026-10-13> (November 12, 2026).

</div>

<div id="ref-GBIF2017" class="csl-entry">

GBIF (2017) Best practices in publishing species checklists, version
2.1. GBIF Secretariat, Copenhagen, Denmark. Available from:
<https://ipt.gbif.org/manual/en/ipt/3.0/best-practices-checklists>
(February 23, 2026).

</div>

<div id="ref-Groometal2019" class="csl-entry">

Groom Q, Desmet P, Reyserhove L, Adriaens T, Oldoni D, Vanderhoeven S,
Baskauf SJ, Chapman A, McGeoch M, Walls R, Wieczorek J, Wilson JRU,
Zermoglio PFF, Simpson A (2019) Improving Darwin Core for research and
management of alien species. Biodiversity Information Science and
Standards 3: e38084. <https://doi.org/10.3897/biss.3.38084>

</div>

<div id="ref-iNaturalist2026occurrence5206387618" class="csl-entry">

<span class="nocase">iNaturalist contributors, iNaturalist</span> (2026)
<span class="nocase">iNaturalist</span> research-grade observations.
<https://doi.org/10.15468/ab3s5x>

</div>

<div id="ref-PhilipFerris2026" class="csl-entry">

Philip KW, Ferris CD (2026) Butterflies of Alaska. Revised Second
Edition. Alaska Entomological Society, Fairbanks, Alaska. Available
from:
<https://www.akentsoc.org/doc/AK_Butterfly_Guide_2026_revision.pdf>
(November 12, 2026).

</div>

</div>

[^1]: <https://gbif.org/occurrence/5206387618>
