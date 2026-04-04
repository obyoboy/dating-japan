# Skill: generate-article (dating-japan)

## Goal
Read `drafts/topic.json` and generate one complete `drafts/article.json` object for this site.
Output must be JSON only.

## Output Format
Return exactly one JSON object with this shape:

```json
{
  "slug": "kebab-case-from-topic-id",
  "lastUpdated": "YYYY-MM-DD",
  "readTimeMinutes": 5,
  "languages": {
    "en": {
      "title": "...",
      "metaDescription": "...",
      "badge": "...",
      "excerpt": "...",
      "image": { "url": "../images/articles/<slug>.jpg", "alt": "..." },
      "bodyHtml": "<h2>1. ...</h2><p>...</p>"
    },
    "tl": {
      "title": "...",
      "metaDescription": "...",
      "badge": "...",
      "excerpt": "...",
      "image": { "url": "../images/articles/<slug>.jpg", "alt": "..." },
      "bodyHtml": "<h2>1. ...</h2><p>...</p>"
    },
    "vi": {
      "title": "...",
      "metaDescription": "...",
      "badge": "...",
      "excerpt": "...",
      "image": { "url": "../images/articles/<slug>.jpg", "alt": "..." },
      "bodyHtml": "<h2>1. ...</h2><p>...</p>"
    }
  }
}
```

## Hard Rules
- Print JSON only to stdout. No markdown, no explanation, no code fences.
- `slug` must exactly match `topic.json.id`.
- `lastUpdated` must be today in JST format `YYYY-MM-DD`.
- `readTimeMinutes` must be an integer from 4 to 9.
- Keep only `en`, `tl`, `vi` language blocks.
- Do not include `<script>` or `javascript:` anywhere.

## Content Rules
- Audience: foreign men dating Japanese women.
- Tone: practical, respectful, non-stereotyped.
- No explicit sexual content, no manipulative advice.
- Keep facts realistic and culturally careful.

## bodyHtml Rules
- 5 to 8 `<h2>` sections.
- Natural paragraphs under each section.
- Include at least one of each:
  - `<div class="tip-box"><strong>Tip</strong> ...</div>`
  - `<div class="warning-box"><strong>Warning</strong> ...</div>`
  - `<table class="key-table">...</table>`

## Badge Suggestions
Use one relevant badge value:
`Culture`, `First Dates`, `Communication`, `Relationships`, `Etiquette`, `Where to Meet`, `Tips & Warnings`.

## Translation Rules
- `en` is source meaning.
- `tl` and `vi` should be natural translations of the same meaning.
- Avoid literal machine-like phrasing.
