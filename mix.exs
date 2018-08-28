defmodule Chatty.Mixfile do
  use Mix.Project

  def project do
    [app: :chatty,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [mod: {ChattyApp, []},
     applications: [:grpc]]
  end

  defp deps do
    [
      {:cowboy, [env: :prod, git: "https://github.com/ninenines/cowboy.git", tag: "2.2.0", override: true, manager: :make]},
      {:ranch, [env: :prod, git: "https://github.com/ninenines/ranch.git", override: true, manager: :make]},
      {:grpc, github: "tony612/grpc-elixir"},
    ]
  end
end
