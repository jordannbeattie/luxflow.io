# Mission 10 CraftCMS Boilerplate
To streamline the process of building websites with CraftCMS, this boilerplate includes the standard settings required to get up and running. 

## Sections & Fields
Included are some standard sections and fields that we have found to be used in the majority of our Craft sites. 

## Plugins
The following plugins are included by default: 
- __Amazon S3__ (used for Asset volumes)
- __Dashboard Begone__ (used to remove Craft dashboard)
- __Expanded Singles__ (used for showing Singles as seperate Sections)
- __Redactor__ (used for text input)
- __SEO__ (used for SEO content on entries)
- __Super Table__ (used to allow multiple fields inside Matrix fields)
- __Typed Link Field__ (used to allow users to insert links in a single field)
- __Image Optimization__ (used to render image tags)

## Getting Started
### Updating Composer packages
Each of the required packages are included with version `"*"`. This is to ensure that when starting a new project, we are using the most up-to-date versions available. To ensure that we do not accidentally update a plugin (which could break parts of the site), you must update the versions. 

You can use `composer show -i` to view a list of the installed packages with their current versions. 

#### Example
Current composer.json contents:
```
"require": {
    "jordanbeattie/craftcms-images" : "*"
}
```

Checking current version:
```
composer show -i
jordanbeattie/craftcms-images v1.0.0
```

Updated composer.json:
```
"require": {
    "jordanbeattie/craftcms-images": "v1.0.0"
}
```

### Updating .env
If the .env file has not been included when you cloned the repository, run the following command to have it created. 
```
cp .env.example .env
```

Once you have your .env file, update the variables as required. 

You may see re-used variables throughout .env, for example: 
```
SITE_NAME="example"
MAIL_FROM_NAME="${SITE_NAME}"
```
This is so that we can update a single variable to manage multiple settings on the site. In the above example, this means that, by default, mail will send as the name of the site but can be overwritten if needed. 
