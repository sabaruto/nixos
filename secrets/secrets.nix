let
  ssh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbr2Z58OpZuhaNqm8VFizveEa5IaqKv3NuZLIXqHrKp";

  halu = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4FW7aXh8+6aM6FZu6+EvsdoZEhOo+gVH3Ivea2ouO6";

  teya = [
    ssh
    halu
  ];
in
{
  "SaltPay_Root_CA.age".publicKeys = teya;
}
