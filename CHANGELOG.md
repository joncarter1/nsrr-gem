## 8.0.0 (August 7, 2021)

### Bug Fix
- Fixed a bug that prevented folders and files with spaces in their paths from
  being downloaded

## 7.0.0 (April 18, 2021)

### Enhancements
- **General Changes**
  - Added `--file` option to specify a regular expression to match a file name,
    (by @k0kubun)

## 6.0.0 (January 16, 2021)

### Enhancements
- **General Changes**
  - Added compatibility for Ruby 3.0.0

## 5.0.0 (May 7, 2019)

### Enhancements
- **General Changes**
  - Update to MIT license
  - Update all server requests to use NSRR API v1
- **Gem Changes**
  - Update to ruby 2.6.3
  - Update to bundler >= 1.3.0
  - Update to simplecov 0.16.1
  - Remove colorize

## 0.4.0 (December 13, 2016)

### Enhancements
- **Gem Changes**
  - Updated to Ruby 2.3.3
  - Updated to colorize 0.8.1
  - Updated to simplecov 0.12.0
  - Updated to bundler 1.13

## 0.3.0 (April 25, 2016)

### Enhancements
- **Download Command**
  - The `nsrr download` command can now download single files
    - Ex: `nsrr download shhs/datasets/CHANGELOG.md`
  - User tokens are stripped of extra whitespace to avoid common authentication
    issues
- **Gem Changes**
  - Updated to Ruby 2.3.0
  - Updated to colorize 0.7.7
  - Updated to simplecov 0.11.2
  - Removed minitest-reporters
  - Bundler is now a required dependency

### Bug Fix
- Fixed an issue that flooded test output with uninitialized string class
  instance variable `@disable_colorization`

## 0.2.0 (May 29, 2015)

### Enhancements
- The `nsrr download` command now allows users to download files from private
  datasets
- The `nsrr download` command provides better feedback on the validity of the
  authorization token provided by the user
- Use of Ruby 2.2.2 is now recommended
- Added text to inform users that input is hidden while entering token

### Bug Fixes
- Fixed an issue preventing public files from being downloaded when an invalid
  token was entered

## 0.1.1 (October 23, 2014)

### Enhancements
- User token input is now hidden to prevent discovery of tokens in console
  history
- Use of Ruby 2.1.3 is now recommended

## 0.1.0 (September 29, 2014)

### Enhancements
- Added a `nsrr download` command that allows users to download partial or
  entire datasets
  - Example: `nsrr download shhs`
- Added a `nsrr console` command that allows users to access and download
  datasets and files
  - Datasets can be loaded in the console environment
    - `d = Dataset.find 'shhs'`
  - Dataset files can be downloaded as well
    - `d.download`
  - The download function can include a path, method, and depth
    - **path**
      - can be `nil` to download entire dataset or a string to specify a folder
    - **method**
      - 'md5' [default]
        - Checks if a downloaded file exists with the exact md5 as the online
          version, if so, skips that file
      - 'fresh'
        - Downloads every file without checking if it was already downloaded
      - 'fast'
        - Only checks if a download file exists with the same file size as the
          online version, if so, skips that file
    - **depth**
      - 'recursive' [default]
        - Downloads files in selected path folder and all subfolders
      - 'shallow'
        - Only downloads files in selected path folder
- Added a `nsrr update` command the provides the user with information on how to
  update the nsrr gem
- Added a `nsrr version` command the returns the current version of the nsrr gem
- Added testing framework to more easily add new tests for new features
