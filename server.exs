Mix.install([{:plug_cowboy, "~> 2.0"}])

defmodule Server do
	use Plug.Router
	plug(:match)
	plug(:dispatch)

	get "/images/celebrate.gif" do
		send_resp(conn, 200, File.read! "images/celebrate.gif")
	end

	get "/index" do
		send_resp(conn, 200, File.read! "index.html")
	end

	get "/styles.css" do
		send_resp(conn, 200, File.read! "styles.css")
	end

	match _ do
		send_resp(conn, 404, File.read! "error.html")
	end
end

Plug.Cowboy.http(Server, [], port: 4000)
System.no_halt(true)

IO.puts("Server Running")
