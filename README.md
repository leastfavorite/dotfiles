# dotfiles
my dotfiles.

note that i'm much less "full-os" oriented than other dotfile setups, which worry
about window managers and desktop environments and all that nonsense.. my
situation is generally that i'm hopping around a variety of different distros
and machines, and i want dotfiles that work predictably in all *nix environments.
as a result, i generally only care about zsh and nvim.

wishlist:
- [ ] does not require root access to install
- [ ] uses system versions of required packages where available
- [x] small
- [ ] auto-updating (detects updates asynchronously, prompts updates without being intrusive)
- [x] portable (everything is contained in the repo folder, uninstalling is just removing the repo folder)
- [x] installation-location-agnostic
- [ ] os-agnostic, distro-agnostic
- [ ] can be run without overriding regular rcfiles
