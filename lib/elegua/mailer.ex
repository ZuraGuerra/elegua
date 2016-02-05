defmodule Elegua.Mailer do

	use Mailgun.Client,
	  domain: Application.get_env(:mailgun, :domain),
	  key: Application.get_env(:mailgun, :key)

	def send_verification_email(to, from, subject, {:text, content}) do
	  send_email to: to,
	    from: from,
	    subject: subject,
	    text: content
	end

	def send_verification_email(to, from, subject, {:html, content}) do
	  send_email to: to,
	    from: from,
	    subject: subject,
	    html: content
	end

end