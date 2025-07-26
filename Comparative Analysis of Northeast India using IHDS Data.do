**TEAM F: NORTHEAST INDIA
**Members: Spandan Dutta, Sanway Sen, Aryaa Banerjee, Soumyadeep Ghosh, Ritimoy Debnath

**Assignment A
** STATEID: 11,12,13,14,15,16,17,18
*Question A1
tab GROUPS6
recode GROUPS6 (2=1) (3=2) (4=3) (5=4) (6=5) (7=6), gen(rcaste)
label define rcaste 1"Hindu Forward Caste" 2"Hindu OBC" 3"Hindu SC" 4"Hindu ST" 5"Muslims" 6"Others"
label value rcaste rcaste
tab rcaste

**Q1A
tabulate rcaste if STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18

**QA2
tab rcaste if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (XPOOR1==1)

**QA3
bysort URBAN: tab rcaste if STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18
bysort URBAN: tab rcaste if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (XPOOR1==1)

**Q4: step 1
tab rcaste if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (POOR2==1)
**Q4: step 2
bysort URBAN: tab rcaste if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (POOR2==1)

**Q5: Poverty transition
**Creating a new 4 categorical variable for poverty transition
gen pov_transition=0 if (XPOOR1==1) & (POOR2==1)
replace pov_transition=1 if (XPOOR1==0) & (POOR2==0)
replace pov_transition=2 if (XPOOR1==1) & (POOR2==0)
replace pov_transition=3 if (XPOOR1==0) & (POOR2==1)
label define pov_transition 0 "Poor stays Poor" 1 "Non-poor stays Non-poor" 2 "Poor moves on to Non-Poor" 3 "Non-poor becomes Poor"
label value pov_transition pov_transition
label variable pov_transition "4 category Poverty Transition"
tab pov_transition

bysort rcaste: tab pov_transition if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18)

**Q8: running prtest to test the diff in prop between nE and India
recode rcaste (1=1) (else = 0), gen(HinduForwIND)
recode rcaste (1=1)(else = 0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18) , gen (HinduForwNE)
prtest HinduForwIND == HinduForwNE
**rural/urban
bysort URBAN: prtest HinduForwIND == HinduForwNE
bysort URBAN: prtest HinduForwIND == HinduForwNE if (XPOOR1==1)

***** for hindu obc***
recode rcaste (2=1) (else = 0), gen(HinduOBCIND)
recode rcaste (2=1)(else = 0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18) , gen (HinduOBCNE)
prtest HinduOBCIND == HinduOBCNE
**rural/urban
bysort URBAN: prtest HinduOBCIND == HinduOBCNE
bysort URBAN: prtest HinduOBCIND == HinduOBCNE if (XPOOR1==1)

****for hindu SC****
recode rcaste (3=1) (else = 0), gen(HinduSCIND)
recode rcaste (3=1)(else = 0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18) , gen (HinduSCNE)
prtest HinduSCIND == HinduSCNE
**rural/urban
bysort URBAN: prtest HinduSCIND == HinduSCNE
bysort URBAN: prtest HinduSCIND == HinduSCNE if (XPOOR1==1)

*****for hindu ST****
recode rcaste (4=1) (else = 0), gen(HinduSTIND)
recode rcaste (4=1)(else = 0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18) , gen (HinduSTNE)
prtest HinduSTIND == HinduSTNE
**rural/urban
bysort URBAN: prtest HinduSTIND == HinduSTNE
bysort URBAN: prtest HinduSTIND == HinduSTNE if (XPOOR1==1)

*****for Muslims*****
recode rcaste (5=1) (else = 0), gen(MUSLIMSIND)
recode rcaste (5=1)(else = 0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18) , gen (MUSLIMSNE)
prtest MUSLIMSIND == MUSLIMSNE
**rural/urban
bysort URBAN: prtest MUSLIMSIND == MUSLIMSNE
bysort URBAN: prtest MUSLIMSIND == MUSLIMSNE if (XPOOR1==1)

*******for Others*****
recode rcaste (6=1) (else = 0), gen(OTHERSIND)
recode rcaste (6=1)(else = 0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18) , gen (OTHERSNE)
prtest OTHERSIND == OTHERSNE
**rural/urban
bysort URBAN: prtest OTHERSIND == OTHERSNE
bysort URBAN: prtest OTHERSIND == OTHERSNE if (XPOOR1==1)
*----------------------------------------------------------------
**Assignment A: For all India sample 
**Q1
tab rcaste

**Q2
**All india Poor
tab rcaste if (XPOOR1==1)

**Q3
**Sorting by Urban/Rural
bysort URBAN: tab rcaste
**Sorting by Urban/Rural for Poor 2004-05
bysort URBAN: tab rcaste if (XPOOR1==1)

**Q4
**All india Poor
tab rcaste if (POOR2==1)

**Sorting by Urban/Rural for Poor 2011-12
bysort URBAN: tab rcaste if (POOR2==1)

**Q5
tab XPOOR1 POOR2, row
bysort rcaste: tab pov_transition
**-----------------------------------------------------------
**Assignment B
tab XASSETS2005 
tab ASSETS5
**Q2
table rcaste XASSETS5 ASSETS5 if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18)
bysort rcaste: tab XASSETS5 ASSETS5 if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18), row

tab XASSETS5 ASSETS5 if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (XPOOR1 == 1), row
tab XPOOR1 ASSETS5 if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (XPOOR1 == 1), row
tab POOR2 ASSETS5 if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18) & (XPOOR1 == 1), row

**Q2: Poverty transition and asset transition simultaneouly
**Class wise Asset Transition 
gen asset_transition=1 if (XASSETS5==1) & (ASSETS5==2|ASSETS5==3|ASSETS5==4|ASSETS5==5)
replace asset_transition=1 if (XASSETS5==2) & (ASSETS5==3|ASSETS5==4|ASSETS5==5)
replace asset_transition=1 if (XASSETS5==3) & (ASSETS5==4|ASSETS5==5)
replace asset_transition=1 if (XASSETS5==4) & (ASSETS5==5)

replace asset_transition=2 if (XASSETS5==5) & (ASSETS5==1|ASSETS5==2|ASSETS5==3|ASSETS5==4)
replace asset_transition=2 if (XASSETS5==4) & (ASSETS5==1|ASSETS5==2|ASSETS5==3)
replace asset_transition=2 if (XASSETS5==3) & (ASSETS5==1|ASSETS5==2)
replace asset_transition=2 if (XASSETS5==2) & (ASSETS5==1)

replace asset_transition=3 if (XASSETS5==1) & (ASSETS5==1)
replace asset_transition=3 if (XASSETS5==2) & (ASSETS5==2)
replace asset_transition=3 if (XASSETS5==3) & (ASSETS5==3)
replace asset_transition=3 if (XASSETS5==4) & (ASSETS5==4)
replace asset_transition=3 if (XASSETS5==5) & (ASSETS5==5)
label define asset_transition 3"No Asset Transition" 1"Increase in Assets" 2"Decline in Assets",modify
label value asset_transition asset_transition
label variable asset_transition "3 category Asset Transition"
***Asset transitions
tab asset_transition if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18)
tab asset_transition
****Mapping Asset transition socio-religious groupwise: NE
bysort rcaste: tab asset_transition if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18)
****Mapping Asset transition socio-religious groupwise: All India
bysort rcaste: tab asset_transition

*****Linking asset and poverty transition
tab asset_transition pov_transition if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18),col chi2
****Linking asset and poverty transition: National Numbers
tab asset_transition pov_transition, col chi2
*****Linking asset and poverty transition Socio religious groupwise
bysort rcaste: tab asset_transition pov_transition if (STATEID== 11|STATEID== 12|STATEID== 13|STATEID== 14|STATEID== 15|STATEID== 16|STATEID== 17|STATEID== 18),col chi2

**B: Q4
*****pr tests for Asset Transitions
**increase
recode asset_transition (1=1) (else=0), gen(incassetINDIA)
recode asset_transition (1=1) (else=0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18), gen(incassetNE)

prtest incassetINDIA==incassetNE

**decrease
recode asset_transition (2=1) (else=0), gen(decassetINDIA)
recode asset_transition (2=1) (else=0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18), gen(decassetNE)

prtest decassetINDIA==decassetNE

**no transition
recode asset_transition (3=1) (else=0), gen(notassetINDIA)
recode asset_transition (3=1) (else=0) if (STATEID == 11 | STATEID == 12 | STATEID == 13 | STATEID == 14 | STATEID == 15 | STATEID == 16 | STATEID == 17 | STATEID == 18), gen(notassetNE)

prtest notassetINDIA==notassetNE
*---------------------------------------------
**Assignment C: Q1
**social groupwise poverty transition and debt to moneylender 
bysort rcaste: tab pov_transition DB1C if (STATEID==11 | STATEID==12 | STATEID==13 | STATEID ==14 | STATEID==15 | STATEID==16 | STATEID==17 | STATEID==18),col chi2
