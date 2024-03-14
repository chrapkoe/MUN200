clear
cd "/Users/elissa/Downloads/MUN200proj"

use "proportion-women-management.dta", clear

drop if ref_area_label != "Philippines"
gen year = real(time)

label variable year "Year"
label variable obs_value "Proportion of Female Managers"

graph twoway line obs_value year, title("Change in Proportion of Female Managers in The Philippines Between 2012 and 2022")
