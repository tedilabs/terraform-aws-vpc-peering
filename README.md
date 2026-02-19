# terraform-aws-vpc-peering

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/tedilabs/terraform-aws-vpc-peering?color=blue&sort=semver&style=flat-square)
![GitHub](https://img.shields.io/github/license/tedilabs/terraform-aws-vpc-peering?color=blue&style=flat-square)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=flat-square)](https://github.com/pre-commit/pre-commit)

Terraform module which creates VPC Peering related resources on AWS.

- [peering](./modules/peering)
- [accepter](./modules/accepter)
- [requester](./modules/requester)


## Target AWS Services

Terraform Modules from [this package](https://github.com/tedilabs/terraform-aws-vpc-peering) were written to manage the following AWS Services with Terraform.

- **AWS VPC (Virtual Private Cloud)**
  - Peering


## Examples

### VPC Peering

- [peering-simple](./examples/peering-simple)
- [peering-cross-region](./examples/peering-cross-region)
- [requester-and-accepter-cross-region](./examples/requester-and-accepter-cross-region)
- [requester-and-accepter-same-region](./examples/requester-and-accepter-same-region)


## Self Promotion

Like this project? Follow the repository on [GitHub](https://github.com/tedilabs/terraform-aws-vpc-peering). And if you're feeling especially charitable, follow **[posquit0](https://github.com/posquit0)** on GitHub.


## License

Provided under the terms of the [Apache License](LICENSE).

Copyright © 2023-2026, [Byungjin Park](https://www.posquit0.com).