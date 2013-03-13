shell-batch-xml-api
===================

Example of submitting a job using Shell Script using the batch xml API.

To run this test you will either need a command shell in Unix (OS X/ Linux) or if you're in a Windows environment, you will need a Unix emulation, such as cygwin  (www.cygwin.com)

After you have one of the two, you will need an account with API access at Click2Mail.com

You can find the documentation for the API here: https://developers.click2mail.com/batch-xml/molpro/getting-started/main

In the batch-config.ini you can set the xml and pdf you will use for the job

xml - the xml file you will be submitting
pdf - the pdf file

Set the username and password using the export variables USERNAME & PASSWORD

Then you can run the program and pass the environment as a command line argument (i.e. ./test-batch.sh stage). Passing "stage" will allow you to test against our staging server. To submit a real order against production pass "pro".

export USERNAME=username; export PASSWORD=username; bash test-batch.sh pro

The test-batch.sh script has outputs such as "Response after pdf upload", each one of these should be empty. The only time a response will actually print, is if there is an error.

After the program is run, you can run batch-status.sh with two command line arguments. Environment, and batch ID in that order. (i.e. ./batch-status.sh prod 152) This will run the job status check on production with batch ID 152.


