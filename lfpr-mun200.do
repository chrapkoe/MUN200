clear
cd "/Users/elissa/Downloads/MUN200proj"

use "lfpr-age&sex.dta", clear
gen year = real(time)

gen male = 0
replace male = 1 if sex_label == "Sex: Male"
gen female = 0
replace female = 1 if sex_label == "Sex: Female"
gen both = 0
replace both = 1 if sex_label == "Sex: Total"

gen real_sex = 0
replace real_sex = 1 if male == 1
replace real_sex = 2 if female == 1
replace real_sex = 3 if both == 1

drop if classif1_label != "Age (Youth, adults): 15+"

label variable year "Year (Note: Duterte 2016, COVID 2019)"
label variable obs_value "Labour Force Participation Rate"


graph twoway (line obs_value year if real_sex==1) (line obs_value year if real_sex==2) (line obs_value year if real_sex==3), title("Differences in Labour Force Participation Rate for Men and Women in the Philippines") legend(order(1 "Total" 2 "Men" 3 "Women"))

sum obs_value if real_sex==1
sum obs_value if real_sex==2
sum obs_value if real_sex==3

