local host = vim.uv.os_gethostname()
local username = os.getenv("USER")
local flakedir = "/home/" .. username .. "/github.com/sabaruto/nixos"
local flake = "(builtins.getFlake " .. flakedir .. ")"

return {
	cmd = { "nixd" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import " .. flake .. ".inputs.nixpkgs { }"

			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr =
						flake .. '.nixosConfigurations.' .. host .. '.options',
				},
				home_manager = {
					expr = flake ..
						'.nixosConfigurations."' .. host .. '".options.home-manager.users.type.getSubOptions []',
				},
			},
		}
	}
}
