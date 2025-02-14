# HandyCT
##### Contact Person/maintain by : parth.shah1@astrazeneca.com

### :warning: DISCAILMER :warning:

*  Fork this repo at your own risk, Astrazeneca is not responsible for ANY actions, plesae follow license APACHE 2.0 Guidelines.
*  This project is still under development with maturity level is ZERO (0) and unvalidated and/or not tested.
*  This project is currently act as prototype and can work as LOOK UP TOOL Only.

### :clipboard: Useful Tips :clipboard:

* Use your personal CDISC API Key to run this project.
* Apply CDISC API  : [Click Here](https://www.cdisc.org/cdisc-library/api-documentation)
* Please ensure to download required R packages listed in global.R inorder to run this application.
  
### :question: Problem Statment :question:

* Extracting/reviewing information about control terminologies requires an extra efforts with conventional methods such as
  download excel/pdf CT files, and search the specific control terminologies is not very efficient method.
* Mainitaining multiple control terminologies with various version and at different published dates for each standards, can be complex and challenging for sponsors.
* Creating a single consolidated excel/pdf file for multiversion, multistandards control terminologies can be challenging with data sourcing, consolidating, distributing and maintaining each quarter for 
   sponsors.
* For consumers/end users, it requires an extra time and efforts to find correct contorol terminology in critical timelines from the consolidated files.

### :smiley: Solution :smiley:

* Integrating CDISC API with R Shiny webframe work, above mentioned problems can be resolved using point and click web application where user can easily access control terminologies
  with limited steps and a very little effort. This morden way to access information comes with high efficiency overall. This also resolve problem for sponsors as it is a single place for combining and 
  distributing control terminologies information for end users. This solution is highly scalable where multiple standards and products can be added such SDTM and ADaM variables based on data avaibility.

### :crystal_ball: Objective :crystal_ball:

* Innovation and simplicity is primary objective of this project where control terminologies can be access with limited effors and with out downloding excel/pdf etc. repeatatively.

### :sparkles: Current Benefits :sparkles:

* Easy to access
* Multiple version and standard access using point and click method
* Download selected control terminologies in excel, pdf etc. from data table.
* Yellow highlighted text when find in table's search box
* Filter the text in real time in search box
  
### :seedling: Ideas to extend this project :seedling:

* Customized with Sponsor's control terminology and CDISC API to get all control terminologies under same location.
* Scalable to add more component such as Raw to SDTM, SDTMIG variables, ADaMIG variables etc.
* Create CRUD opertation application for spec generation.
* Upload data and cross verify control terminologies etc.

### :collision: Risk/limitations :collision: 

* Highly reliable on CDISC API, if any event CDISC API not able to produce result it might not reflect information (Medium Risk)
* CDISC API architecture modifies, which usually not happen often. (Low Risk)
* Serving to wider audiance may need good bandwith and server space (Limitations)

### :telescope: Working Prototype :telescope:

* [https://shahparth.shinyapps.io/handyct/](https://shahparth.shinyapps.io/handyct/)
