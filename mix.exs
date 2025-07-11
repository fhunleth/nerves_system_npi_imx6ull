defmodule NervesSystemNPiIMX6ULL.MixProject do
  use Mix.Project

  @github_organization "fhunleth"
  @app :nerves_system_npi_imx6ull
  @source_url "https://github.com/#{@github_organization}/#{@app}"
  @version Path.join(__DIR__, "VERSION")
           |> File.read!()
           |> String.trim()

  def project do
    [
      app: :nerves_system_npi_imx6ull,
      version: @version,
      elixir: "~> 1.9",
      compilers: Mix.compilers() ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: [loadconfig: [&bootstrap/1]],
      docs: docs()
    ]
  end

  def application do
    []
  end

  defp bootstrap(args) do
    set_target()
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  def cli do
    [preferred_envs: %{docs: :docs, "hex.build": :docs, "hex.publish": :docs}]
  end

  defp nerves_package do
    [
      type: :system,
      artifact_sites: [
        {:github_releases, "#{@github_organization}/#{@app}"}
      ],
      build_runner_opts: build_runner_opts(),
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      # The :env key is an optional experimental feature for adding environment
      # variables to the crosscompile environment. These are intended for
      # llvm-based tooling that may need more precise processor information.
      env: [
        {"TARGET_ARCH", "arm"},
        {"TARGET_CPU", "cortex_a7"},
        {"TARGET_OS", "linux"},
        {"TARGET_ABI", "gnueabihf"},
        {"TARGET_GCC_FLAGS",
         "-mabi=aapcs-linux -mfpu=neon-vfpv4 -marm -fstack-protector-strong -mfloat-abi=hard -mcpu=cortex-a7 -fPIE -pie -Wl,-z,now -Wl,-z,relro"}
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.11", runtime: false},
      {:nerves_system_br, "1.31.3", runtime: false},
      {:nerves_toolchain_armv7_nerves_linux_gnueabihf, "~> 13.2.0", runtime: false},
      {:nerves_system_linter, "~> 0.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.22", only: :docs, runtime: false}
    ]
  end

  defp description do
    """
    Nerves System - NPi i.MX6ULL
    """
  end

  defp docs do
    [
      extras: ["README.md", "CHANGELOG.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package do
    [
      files: package_files(),
      licenses: ["GPL-2.0-only", "GPL-2.0-or-later"],
      links: %{
        "GitHub" => @source_url,
        "REUSE Compliance" =>
          "https://api.reuse.software/info/github.com/fhunleth/nerves_system_npi_imx6ull"
      }
    ]
  end

  defp package_files do
    [
      "fwup_include",
      "linux",
      "rootfs_overlay",
      "uboot",
      "CHANGELOG.md",
      "fwup-revert.conf",
      "fwup.conf",
      "LICENSES/*",
      "mix.exs",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh",
      "README.md",
      "REUSE.toml",
      "VERSION"
    ]
  end

  defp build_runner_opts() do
    # Download source files first to get download errors right away.
    [make_args: primary_site() ++ ["source", "all", "legal-info"]]
  end

  defp primary_site() do
    case System.get_env("BR2_PRIMARY_SITE") do
      nil -> []
      primary_site -> ["BR2_PRIMARY_SITE=#{primary_site}"]
    end
  end

  defp set_target() do
    if function_exported?(Mix, :target, 1) do
      apply(Mix, :target, [:target])
    else
      System.put_env("MIX_TARGET", "target")
    end
  end
end
