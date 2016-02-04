defmodule Elegua.Mailer do

	use Mailgun.Client,
	  domain: Application.get_env(:mailgun, :domain),
	  key: Application.get_env(:mailgun, :key)

	
end