---
number: 845
title: How to show last message in a chat with or without scrollToIndex
category: Q&A
created: 2024-09-30
url: "https://github.com/TanStack/virtual/discussions/845"
upvotes: 3
comments: 0
answered: false
---

# How to show last message in a chat with or without scrollToIndex

Hello,

I have a problem with my chat app, i would like to show directly the last message without to see the scroll going to the end, actually i tried a lot of things but nothing working good. 

this is the code:

```
const [filteredMessages, setFilteredMessages] = useState<MessageProps[]>([]);
	const parentRef = useRef<HTMLDivElement>(null)

	// filter messages by conversation id and sort them by date
	useEffect(() => {
		const messages = messageStore
			.filter((message) => message.conversation_id === conversationIdState)
			.sort((a, b) => new Date(Number(a.created_at)).getTime() - new Date(Number(b.created_at)).getTime());
		setFilteredMessages(messages);
	}, [messageStore, conversationIdState]);
	
	// The virtualizer
	const rowVirtualizer = useVirtualizer({
		count: filteredMessages.length,
		getScrollElement: () => parentRef.current,
		estimateSize: () => 320,
		overscan: 5,
	})

	useLayoutEffect(() => {
		requestAnimationFrame(() => {
		rowVirtualizer.scrollToIndex(filteredMessages.length - 1);
		});

	  }, [filteredMessages.length, rowVirtualizer]);
	  
```...