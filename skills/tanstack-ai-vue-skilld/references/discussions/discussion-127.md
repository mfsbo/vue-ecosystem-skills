---
number: 127
title: Why this is not working?
category: Q&A
created: 2025-12-09
url: "https://github.com/TanStack/ai/discussions/127"
upvotes: 1
comments: 2
answered: true
---

# Why this is not working?



## **Title:** Tool calling not working with TanStack AI + Ollama (LLaMA 3) — tool never triggers

### **Category:** Q&A

---

## **Problem**

I’m using **TanStack AI + Ollama + Server Streaming** with a custom tool (`get_post`).
The UI streams messages, but **the tool never gets called**.

Instead of calling the tool, the model didn't send any thing but i remove it responds 

---

## **My Setup**

### **Server (`route.ts`)**

```ts
const stream = chat({
  adapter,
  messages,
  model: "llama3",
  conversationId,
  tools: [
    getPostServer, // ← I think this might be wrong?
  ],
});
```

### **Client (`chat.tsx`)**

```ts
const { messages, sendMessage } = useChat({
  connection: fetchServerSentEvents("/api/chat"),
});
```

### **Tool Definition**...

---

## Accepted Answer

llama 3 doesn't support tools, maybe try using 3.1 and it should work