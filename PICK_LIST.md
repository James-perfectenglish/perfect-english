# Pick list — 14 clips for perfect-english.org

Name each trimmed export exactly as in the first column (capitals and spaces are
fine — the prep script slugifies them, so `Spelling Bee.mp4` becomes
`spelling-bee.mp4`, which is what the page expects). Drop them all in one
folder, then run `./prep-web-videos.sh /path/to/that/folder` from the repo root.

**The picking rule for every clip:** one complete interaction. Start
mid-action (never a menu, login or loading state), end on the payoff — the
tick, the confetti, the star, the rank-up. The final frame becomes the poster
image, so make it the best frame. LosslessCut snaps cuts to keyframes, so the
clip may start a beat earlier than your In point — set In slightly *after* the
true start and it'll land right.

## Daily games (4)

| Export name | Source in Screen grabs | The moment | Length |
|---|---|---|---|
| `Wordle.mp4` | Wordle 4-3.mp4 | Final guess typed → tiles flip green → win | 6–10s |
| `Spelling Bee.mp4` | Spelling Bee 4-3.mp4 | Two or three words found → rank climbs | 6–10s |
| `Connections.mp4` | Connections 4-3.mp4 (or general 4-3) | Four tiles selected → group solves | 6–10s |
| `Crossword.mp4` | Crossword 4-3.mp4 | A word being filled → completes correctly | 6–10s |

## Daily learning (3)

| Export name | Source in Screen grabs | The moment | Length |
|---|---|---|---|
| `WOTD.mp4` | WOTD 4-3.mp4 (best of the four variants) | Card revealed → audio/example → sentence challenge glimpse | 6–10s |
| `GOTD.mp4` | GOTD 2 4-3.mp4 | Card scroll: structure → example → common mistake | 6–10s |
| `PVOTD.mp4` | PVOTD 4-3.mp4 (best of the three variants) | Card revealed → meaning/example → sentence challenge glimpse | 6–10s |

## Practice (4)

| Export name | Source in Screen grabs | The moment | Length |
|---|---|---|---|
| `Fix it.mp4` | Fix it good 4-3.mp4 | Mistake spotted → fixed → marked correct | 8–12s |
| `Tense Tagger.mp4` | To tense tagger 4-3.mp4 | Sentence tagged → confirmed right | 8–12s |
| `Real Talk.mp4` | Real talk 4-3.mp4 | A choice made → the conversation branches → feedback | 8–12s |
| `Listening.mp4` | Listening 4-3.mp4 | Audio playing → answer chosen → correct | 8–12s |

## Hero & business (3)

| Export name | Source in Screen grabs | The moment | Length |
|---|---|---|---|
| `Hero.mp4` | Your favourite — Spelling Bee 4-3 or Wordle 4-3 recommended | The most satisfying continuous stretch of play you have | 15–25s |
| `Teacher Dashboard.mp4` | Teacher dashboard.web.mp4 | A proper browse: student list → drill into results | 15–25s |
| `Progress.mp4` | Progress vertical.mp4 | Scrolling stars/progress — portrait suits this slot | 10–15s |

## Notes

- The page's slots assume the **4-3 composited exports** (phone on gradient)
  for hero, games, learning and practice; **the landscape web recording** for
  the teacher dashboard; and **the vertical export** for progress. If a
  different variant looks better for any slot, use it — `object-fit: cover`
  will crop gracefully.
- No Wordsearch clip exists in the folder. The games section runs four clips
  and mentions Wordsearch in the text, so nothing is blocked.
- Anything the prep script flags as over 4 MB just needs a shorter trim.
- Keep your trimmed picks folder — if we ever change compression settings we
  re-run the script over the same picks in seconds.
- This file is working scaffolding — delete it once the clips are done, or
  leave it; it harms nothing.
