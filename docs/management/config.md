# Repository Configuration

There are several configurations to utilize the features provided by the project template. These are only the essential ones, you can adjust according to your project's actual needs.

::::{tab-set}

:::{tab-item} GitHub
:sync: github

1. Branch protection:
    1. Navigate to the [Branch protection rules](https://github.com/serious-scaffold/ss-python/settings/branches) settings.
    1. Ensure a rule for the default `main` branch.
    1. Enable **Require a pull request before merging** with **Require approvals** and **Dismiss stale pull request approvals when new commits are pushed** enabled.
    1. Enable **Require status checks to pass before merging** and set [ci](https://github.com/serious-scaffold/ss-python/actions/workflows/ci.yml) and [commitlint](https://github.com/serious-scaffold/ss-python/actions/workflows/commitlint.yml) as required status checks.
1. Tag protection:
    1. Navigate to the [Protected tags](https://github.com/serious-scaffold/ss-python/settings/tag_protection) settings.
    1. Create a rule for tag name pattern `v*`.
1. Squash merge enforcement:
    1. Navigate to the [General](https://github.com/serious-scaffold/ss-python/settings) settings and the **Pull Requests** section.
    1. Disable **Allow merge commits** and **Allow rebase merging**.
    1. Enable **Allow squash merging** and set **Pull request title** as **Default commit message**.
1. GitHub Pages with GitHub Actions:
    1. Navigate to the [GitHub Pages](https://github.com/serious-scaffold/ss-python/settings/pages) settings.
    1. Set **GitHub Actions** as **Source**.
1. Package publish authentication:
    1. Navigate to the [Actions secrets and variables](https://github.com/serious-scaffold/ss-python/settings/secrets/actions) settings.
    1. Set the **variable** `PDM_PUBLISH_REPO`, the repository (package index) URL to upload the package which defaults to `https://pypi.org`, the official PyPI.
    1. Set the **variable** `PDM_PUBLISH_USERNAME`, the username to authenticate to the repository (package index) which defaults to `__token__`, used for [API token](https://pypi.org/help/#apitoken).
    1. Set the **secret** `PDM_PUBLISH_PASSWORD`, the password to authenticate to the repository (package index).
1. Renovate authentication:

    There are two approaches, either with GitHub App or with personal access token (classic). GitHub App is the more recommended way to avoid the issues and pull requests tied to a particular user.

    ::::{tab-set}

    :::{tab-item} GitHub App
    1. [Register a GitHub App](https://docs.github.com/en/apps/creating-github-apps/registering-a-github-app/registering-a-github-app) with permission listed [here](https://docs.renovatebot.com/modules/platform/github/#running-as-a-github-app).
    1. [Generate a private key](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/managing-private-keys-for-github-apps#generating-private-keys), and download the private key as a `.pem` file.
    1. Navigate to the [Actions secrets and variables](https://github.com/serious-scaffold/ss-python/settings/secrets/actions) settings.
    1. Set **App ID** of the GitHub App as **variable** `BOT_APP_ID`.
    1. Set the content of the private key as **secret** `BOT_PRIVATE_KEY`.
    :::

    :::{tab-item} personal access token (classic)
    1. [Create a personal access token (classic)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic) with **workflow** scope.
    1. Navigate to the [Actions secrets and variables](https://github.com/serious-scaffold/ss-python/settings/secrets/actions) settings and set the token as a **secret** `RENOVATE_TOKEN`.
    :::

    ::::

```{note}
You can set the scope of the variables and secrets to **Repository** or **Organization** according to actual requirements.
```

:::

:::{tab-item} GitLab
:sync: gitlab

1. Branch protection:
    1. Navigate to the [Repository](https://gitlab.com/serious-scaffold/ss-python/-/settings/repository) settings and the **Protected branches** section.
    1. Ensure the default `main` branch is protected with **Maintainers** for **Allowed to merge**, **No one** for **Allowed to push and merge** and **Allowed to force push** disabled.
1. Tag protection:
    1. Navigate to the [Repository](https://gitlab.com/serious-scaffold/ss-python/-/settings/repository) settings and the **Protected tags** section.
    1. Add a rule with wildcard `v*` for **Tag** and **Maintainers** for **Allowed to create**.
1. Squash merge and pipeline check enforcement:
    1. Navigate to the [Merge requests](https://gitlab.com/serious-scaffold/ss-python/-/settings/merge_requests) settings.
    1. Set **Fast-forward merge** for the **Merge method**.
    1. Set **Require** for the **Squash commits when merging**.
    1. Enable **Pipelines must succeed** in the **Merge checks**.
1. Package publish authentication:
    1. Navigate to the [CI/CD](https://gitlab.com/serious-scaffold/ss-python/-/settings/ci_cd) settings and the **Variables** section.
    1. Set the variable `PDM_PUBLISH_REPO`, the repository (package index) URL to upload the package, default to `https://pypi.org`, the official PyPI.
    1. Set the variable `PDM_PUBLISH_USERNAME`, the username to authenticate to the repository (package index), default to `__token__`, used for [API token](https://pypi.org/help/#apitoken).
    1. Set the variable `PDM_PUBLISH_PASSWORD` with the **Mask variable** option for security, the password to authenticate to the repository (package index).
1. Renovate authentication:

    Either [Group access tokens](https://docs.gitlab.com/ee/user/group/settings/group_access_tokens.html), [Project access tokens](https://docs.gitlab.com/ee/user/project/settings/project_access_tokens.html) or [Personal access tokens](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) can be used. The group or project access tokens are more recommended to avoid the issues and merge requests tied to particular user.

    1. Create a [group access token](https://gitlab.com/groups/serious-scaffold/-/settings/access_tokens), [project access token](https://gitlab.com/serious-scaffold/ss-python/-/settings/access_tokens) or [personal access token](https://gitlab.com/-/user_settings/personal_access_tokens) with `api, write_repository` scope.
    1. Navigate to the [CI/CD](https://gitlab.com/serious-scaffold/ss-python/-/settings/ci_cd) settings and the **Variables** section. Set the token as variable `RENOVATE_TOKEN` with the **Mask variable** option for security.
    1. Navigate to the [Pipeline schedules](https://gitlab.com/serious-scaffold/ss-python/-/pipeline_schedules). Create a new schedule with `*/15 0-3 * * 1` as **Interval Pattern** and mark it as **Activated**.

    ```{note}
    Although optional, [creating a personal access token (classic)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic) on **GitHub** is strongly recommended. This token only needs `read-only` access and will increase the rate limit for Renovate to fetch dependencies and changelogs from github.com. It can be from any account and should be set as the variable `GITHUB_COM_TOKEN` with the **Mask variable** option for security. For more information on setting this up, see [Renovate's documentation](https://docs.renovatebot.com/getting-started/running/#githubcom-token-for-changelogs).
    ```

:::

::::
