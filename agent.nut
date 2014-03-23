/*
The MIT License (MIT)

Copyright (c) 2014 MakeDeck LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

const API_KEY = "key-your_mailgun_api_key";
const MAILGUN_URL = "api.mailgun.net/v2/";
const MAILGUN_DOMAIN = "your_mailgun_domain_goes_here.mailgun.org";
const FROM = "First Last <yourname@youremail.com>";
const TO = "First Last <toemail@toemail.com>";
const SUBJECT = "Testing Mailgun";
const EMAIL_MESSAGE = "I am sending email through MailGun from an Electric Imp!";

function send_mailgun_email() {
    local url = format("https://api:%s@%s%s/messages", API_KEY, MAILGUN_URL, MAILGUN_DOMAIN);
    local headers = {"Content-Type": "application/x-www-form-urlencoded"};
    local body = http.urlencode({from=FROM, to=TO, subject=SUBJECT, text=EMAIL_MESSAGE});
    http.post(url,headers,body).sendasync(function(res) {
        if (res.statuscode != 200) {
            server.error("Mailgun error: " + res.statuscode + " => " + res.body);
        } else {
            try {
                server.log(res.body);
            } catch (e) {
                server.error("Mailgun error: " + e)
            }
        }
    })
}

// Use this with example device code
// Uncomment the three lines below
//device.on("event", function(data) {
//    send_mailgun_email();
//});
