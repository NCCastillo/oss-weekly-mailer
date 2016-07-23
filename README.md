# oss-weekly-mailer

The goal for this rails app is to listen to merge events on the
oss-wumbo repo with a `weekly email` label and send off an email to
all of the frontside. It will include eight metrics over the previous
week in open source:

- Issues closed count
- Issues opened count
- PRs opened count
- PRs merged
- PRs closed
- Releases cut (new tags) count
- Total new stars
- New Forks count

Along with those metrics it should include the email that was written
and merged into oss-wumbo.
