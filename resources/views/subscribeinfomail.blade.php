<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-GB">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Email Design</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <style type="text/css">
    a[x-apple-data-detectors] {color: inherit !important;}
  </style>

</head>
<body style="margin: 0; padding: 0;">
  <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td style="padding: 20px 0 30px 0;">
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
          <tr>
            <td align="center" bgcolor="#70bbd9">
              <img src="https://nutridock.com/uploads/images/thank-you.jpg" alt="Thank You" width="600"  style="display: block;" />
            </td>
          </tr>
          <tr>
            <td style="padding: 20px 25px 10px 25px;background-color: #d8ffcf;">
              <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                <tr>
                  <td style="color: #1a2127; font-family: Arial, sans-serif;">
                    <h1 style="font-size: 24px; color: #6dc83c;">Welcome to Nutridock</h1>
                    <h2 style="margin: 0px;text-transform: uppercase">Hello <?php echo $name ?>,</h2>
                  </td>
                </tr>
                <tr>
                  <td style="color: #222; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0 30px 0;">
                    <p style="margin: 0;">Thank you for joining the Subscription plan of Nutridock.</p>
                    <p>Please find below username & password-</p>
               		<strong>Username -</strong><?php echo $email ?>.<br>
               		<strong>Password -</strong><?php echo decrypt($password); ?>.<br>
              		<br>Thanks & Regards<br>Team Nutridock.<br></span></span>
                  </td>
                </tr>
               
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>