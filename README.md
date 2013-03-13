shell-batch-xml-api
===================

Example of submitting a job using Shell Script using the batch xml API.

To run this test you will either need a command shell in Unix (OS X/ Linux) or if you're in a Windows environment, you will need a Unix emulation, such as cygwin  (www.cygwin.com)

After you have one of the two, you will need an account with API access at Click2Mail.com

You can find the documentation for the API here: https://developers.click2mail.com/batch-xml/molpro/getting-started/main

In test-batch.sh first set up your username and password by setting the uname and pword parameters.

In the batch-config.ini you can set the xml and pdf you will use for the job

xml - the xml file you will be submitting
pdf - the pdf file

Then you can run the program and pass the environment as a command line argument (i.e. ./test-batch.sh dev). If you leave it blank (for production) the program will ask you if you're sure you'd like to submit to production, this is so you don't accidentally use money when not intended to.

The test-batch.sh script has outputs such as "Response after pdf upload", each one of these should be empty. The only time a response will actually print, is if there is an error.

After the program is run, you can run batch-status.sh with two command line arguments. Environment, and batch ID in that order. (i.e. ./batch-status.sh prod 152) This will run the job status check on production with batch ID 152.


