# v2.3.3

## Refactor
* refactor: update limit_by_label field (#41) (Darren)([bac0faf](https://github.com/lacework/terraform-gcp-gcr/commit/bac0faf6a9615922fd729fe3ec13efb7b4261734))
## Other Changes
* ci: version bump to v2.3.3-dev (Lacework)([5cd8562](https://github.com/lacework/terraform-gcp-gcr/commit/5cd85625b77bcd968af595696f535c5b4479f93f))
---
# v2.3.2

## Bug Fixes
* fix: empty project_id in google_project data source (#39) (Salim Afiune)([7979c0d](https://github.com/lacework/terraform-gcp-gcr/commit/7979c0dfc8ea52906d37cbb019929c9906ba43b0))
## Other Changes
* ci: version bump to v2.3.2-dev (Lacework)([08c675f](https://github.com/lacework/terraform-gcp-gcr/commit/08c675f9f745a5c2da8033cbcd8d142b63670a4d))
---
# v2.3.1

## Bug Fixes
* fix: examples/ google constraint (#35) (Salim Afiune)([75fc89e](https://github.com/lacework/terraform-gcp-gcr/commit/75fc89e2318badc61a4913e46a556602c75b2745))
## Documentation Updates
* docs: update Lacework provider version in readme (#37) (Darren)([dd62b73](https://github.com/lacework/terraform-gcp-gcr/commit/dd62b731d3831e28bb3c9567334dda66f486e539))
## Other Changes
* chore: update Lacework provider version to v1 (#36) (Darren)([d1131a1](https://github.com/lacework/terraform-gcp-gcr/commit/d1131a121088d66e9bdb9205f0bcb2ea1099176b))
* ci: version bump to v2.3.1-dev (Lacework)([9e4e393](https://github.com/lacework/terraform-gcp-gcr/commit/9e4e3938032db2a22c21727decf3a78b2f26ead5))
---
# v2.3.0

## Features
* feat: deprecate support for Terraform 0.12 and 0.13 (#33) (Darren)([5199822](https://github.com/lacework/terraform-gcp-gcr/commit/51998228cf27d0c2e6dbddb493d89043d2ac4196))
* feat: allow setting permission at bucket level (#31) (Labesse Kévin)([7ff49f2](https://github.com/lacework/terraform-gcp-gcr/commit/7ff49f2aeeaed53c2684af88d6313496ffc7a04f))
## Other Changes
* chore: update PR template (#32) (Darren)([6c2a5be](https://github.com/lacework/terraform-gcp-gcr/commit/6c2a5bea84a494975cb5e5ca15b225869389489f))
* ci: version bump to v2.2.1-dev (Lacework)([002c537](https://github.com/lacework/terraform-gcp-gcr/commit/002c537ee6e412b711d58054dd6c5cabcf81ed0e))
---
# v2.2.0

## Features
* feat: update google provider version to 4.0 (#29) (Darren)([7cddd7f](https://github.com/lacework/terraform-gcp-gcr/commit/7cddd7f8d293fe0f91324da4420aa048b2b373a5))
## Other Changes
* ci: version bump to v2.1.1-dev (Lacework)([46bbdeb](https://github.com/lacework/terraform-gcp-gcr/commit/46bbdeb48ad3c93c8c587765d7388371b03e9e58))
---
# v2.1.0

## Features
* feat: update non_os_package_support flag (#27) (Darren)([2d239b7](https://github.com/lacework/terraform-gcp-gcr/commit/2d239b778a2c3a81baafe883f32361589f268f42))
## Other Changes
* ci: version bump to v2.0.1-dev (Lacework)([3cd0af2](https://github.com/lacework/terraform-gcp-gcr/commit/3cd0af2471e8cdd877b017ca93b41cb8a4443f10))
---
# v2.0.0

## Other Changes
* chore: Update deprecated attributes, limit_by_labels, limit_by_tags, limit_by_repositories (Darren Murray)([de33262](https://github.com/lacework/terraform-gcp-gcr/commit/de33262c857bcbb89eca89afd8cba34dd769d606))
* ci: version bump to v1.1.1-dev (Lacework)([6b83bea](https://github.com/lacework/terraform-gcp-gcr/commit/6b83beab38512a342a7661a0f810b0091f2c621f))
---
# v1.1.0

## Features
* feat(variables): adding non_os_package_support option (#22) (Tim Frazier)([3391512](https://github.com/lacework/terraform-gcp-gcr/commit/33915129e3a88dcb6295b397ff270420dd52ba72))
## Documentation Updates
* docs: Add contributing documentation (#21) (Darren)([e0162ad](https://github.com/lacework/terraform-gcp-gcr/commit/e0162ad374b34d2441acaf31146cf579c48e552e))
## Other Changes
* chore: version bump to v1.0.2-dev (Lacework)([64bb152](https://github.com/lacework/terraform-gcp-gcr/commit/64bb152f3100d8f56fe7373ed387f21a993f69a7))
* ci: sign lacework-releng commits (#20) (Salim Afiune)([b361982](https://github.com/lacework/terraform-gcp-gcr/commit/b3619827486e86d2f61368bcc851cd3d9919ee8a))
---
# v1.0.1

## Documentation Updates
* docs: Update README with new Status Badge (#13) (Salim Afiune)([b0970fb](https://github.com/lacework/terraform-gcp-gcr/commit/b0970fb495baf28204b05b4373b81ad809585723))
## Other Changes
* chore: version bump to v1.0.1-dev (Lacework)([4858ff6](https://github.com/lacework/terraform-gcp-gcr/commit/4858ff618fabfed8ae34b47e72a45b5078652776))
* ci: fix finding major versions during release (#14) (Salim Afiune)([66801a3](https://github.com/lacework/terraform-gcp-gcr/commit/66801a330ff19eef2685b71e18a14c16d1cdd495))
* ci: remove CircleCI completely (#12) (Salim Afiune)([81380d7](https://github.com/lacework/terraform-gcp-gcr/commit/81380d7c8f4d8a0e23ce2013937573c48f52fea8))
---
# v1.0.0

## Refactor
* refactor: Move GCR logic from service-acccount to GCR module (#1) (Ross)([d8f50fe](https://github.com/lacework/terraform-gcp-gcr/commit/d8f50fed4439e5b4b007f75670e30a80f1535a0c))
## Other Changes
* ci: force release branch update (#9) (Salim Afiune)([1e5a917](https://github.com/lacework/terraform-gcp-gcr/commit/1e5a9173ac15baae1a6be9deba5e44d223a69038))
* ci: switch PR test from CircleCI to CodeFresh (#7) (Salim Afiune)([f284a38](https://github.com/lacework/terraform-gcp-gcr/commit/f284a3801585bb4a2dd20850ef0f3c8d19415016))
* ci: fix release_helper script source (#6) (Salim Afiune)([c423ea1](https://github.com/lacework/terraform-gcp-gcr/commit/c423ea1a16efd84a6196c3fa67f0ca09a2478a09))
* ci: abstract common release helpers (#5) (Salim Afiune)([63e1dfc](https://github.com/lacework/terraform-gcp-gcr/commit/63e1dfc83d1a8a44dd6eabf1eb1baa081a3f6c80))
* ci: prepare triggering releases from CodeFresh (#3) (Salim Afiune)([fe9d225](https://github.com/lacework/terraform-gcp-gcr/commit/fe9d225d3a60b9cfae0aba880dbc942c2249772c))
* ci: update pre-release script (#2) (Ross)([9309b44](https://github.com/lacework/terraform-gcp-gcr/commit/9309b4422ea2aae9adc1eed8aabbcadec37e717b))
---
