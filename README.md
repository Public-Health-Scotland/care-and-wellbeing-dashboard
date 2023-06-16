# Care & Wellbeing Dashboard

-   This is a Public Health Scotland R shiny app available to the public at <https://scotland.shinyapps.io/phs-care-and-wellbeing-dashboard/>

## Additional files needed to run the R shiny app

-   Various data files are required for this dashboard, the sources of which can be found in the metadata file. Contact [phs.covid19data&analytics\@phs.scot](mailto:phs.covid19data&analytics@phs.scot) for further information.
-   The following files must be obtained from colleagues:
    -   `shiny_app/www/google-analytics.html`
    -   `shiny_app/AppDeployment.R`

## Deploying the R shiny app

1.  Navigate to `data_transfer/data_transfer_master.R` and source. This prepares the data for use in the app.

2.  The section between lines 345 and 374 of the script above transfers the prepared files to `shiny_app/data`.

3.  Run app from `shiny_app/app.R` to view app locally to check content.

4.  Obtain `shiny_app/AppDeployment.R` from colleagues. Edit the paths to point to your local `shiny_app` folder.

5.  Source the script to deploy the app.

## Developing the R shiny app

### Data transfer layout

-   `data_transfer` contains the data transfer code. This is for transferring data from mixed inputs to a format ready for use in the app.

-   `data_transfer_master.R` is the script for doing the transfer and preparing the data folder

-   `data_transfer_sections` contains individual scripts called from `data_transfer_master.R`

### App code layout

-   `shiny_app` contains all the app code

-   `app.R` is the main app file

-   `setup.R` contains the necessary packages and some settings. This is run once on deployment and not for every new user. It also loads all the data in `shiny_app/data`.

-   `data` contains all the data needed for the shiny app. It is populated using the `data_transfer_master.R` script

-   `functions` contains general functions used in several places across the app.

    -   `core_functions.R` includes general functions

    -   `generic_charts.R` includes general plotting functions including functions to make specific plots.

-   `www` contains static images as well as additional css and javascript code

-   `modules` contains sub-folders of shiny modules used by the app

-   `indicators` contains sub-folders for each tab in the app.

    -   `care_and_wellbeing` contains sub-folders for each indicator that can be viewed within the care and wellbeing tab.

    -   All sub-folders and all folders contained in care and wellbeing contain a ui script, a server script, a functions script and an info script.
