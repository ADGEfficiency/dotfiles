#!/usr/bin/env sh
echo "== ~/personal/area/writing =="
ls -t ~/personal/area/writing

echo "== final-personal-blog/_drafts =="
ls -t ~/personal/area/blogs/final-personal-blog/_drafts

echo "== adgefficiency.com (draft: true) =="
grep -rl 'draft: true' ~/personal/area/blogs/adgefficiency.com/content
