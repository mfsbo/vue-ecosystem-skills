---
number: 6176
title: Using Server Functions with progressive enhancement
category: Q&A
created: 2025-12-21
url: "https://github.com/TanStack/router/discussions/6176"
upvotes: 1
comments: 1
answered: true
---

# Using Server Functions with progressive enhancement

What's the correct way to use server functions with progressive enhancement?

it's documented that it can be done with .url but i can't see to figure it out:

https://tanstack.com/start/latest/docs/framework/react/guide/server-functions#progressive-enhancement

I have a form that posts:

```js
<form method="post" action={createBookmark.url}>
				<input type="hidden" name="year" value={year} />
				<input type="hidden" name="type" value={type} />
				<input type="hidden" name="slug" value={slug} />
				<input type="hidden" name="status" value={nextStatus} />
				<input type="hidden" name="returnTo" value={returnTo} />
				<Button
					variant="outline"
					disabled={!canSubmit}
					title={
						canSubmit
							? "Bookmark this item"
							: "Sign in to bookmark events"
					}
					type="submit"
				>
					<Icons.star
						className={status === "favourited" ? "icon--filled" : ""}
					/>
				</Button>
			</form>
```...

---

## Accepted Answer

checkout https://github.com/TanStack/router/blob/main/e2e/react-start/server-functions/src/routes/submit-post-formdata.tsx

you need to use `FormData` 