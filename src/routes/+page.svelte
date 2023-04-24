<script lang="ts">
	import ChatMessage from '../components/ChatMessage.svelte'
    import type { ChatCompletionRequestMessage } from 'openai'
	import { SSE } from 'sse.js'

    let query: string = ''
	let answer: string = ''
	let loading: boolean = false
	let chatMessages: ChatCompletionRequestMessage[] = []
	let scrollToDiv: HTMLDivElement

	function scrollToBottom() {
		setTimeout(function () {
			scrollToDiv.scrollIntoView({ behavior: 'smooth', block: 'end', inline: 'nearest' })
		}, 100)
	}

    const handleSubmit = async () => {
        loading = true
		chatMessages = [...chatMessages, { role: 'user', content: query}]
		const eventSource = new SSE('/api/chat', {
			headers: {
				'Content-Type': 'application/json'
			},
			payload: JSON.stringify({ messages: chatMessages })
		})
        query = ''
		eventSource.addEventListener('error', handleError)
		eventSource.addEventListener('message', (e) => {
			scrollToBottom()
			try {
				loading = false
				if (e.data === '[DONE]') {
					chatMessages = [...chatMessages, { role: 'assistant', content: answer}]
					answer = ''
					return
				}
				const completionResponse = JSON.parse(e.data)
				const [{ delta }] = completionResponse.choices
				if (delta.content) {
					answer = (answer ?? '') + delta.content
				}
			} catch (err) {
				handleError(err)
			}
		})
		eventSource.stream()
		scrollToBottom()
    }

    function handleError<T>(err: T) {
		loading = false
		query = ''
		answer = ''
		console.error(err)
	}
</script>

<!-- Component Start -->
<div class="flex flex-col flex-grow w-full max-w-xl bg-white shadow-xl rounded-lg overflow-hidden">
    <div class="flex flex-col flex-grow h-0 p-4 overflow-auto">
        <ChatMessage type="assistant" message="Hello, ask me anything you want!" />
        {#each chatMessages as message}
            <ChatMessage type={message.role} message={message.content} />
        {/each}
        {#if answer}
            <ChatMessage type="assistant" message={answer} />
        {/if}
        {#if loading}
            <ChatMessage type="assistant" message="Loading.." />
        {/if}
        <div class="" bind:this={scrollToDiv} />
    </div>
    
    <div class="bg-gray-300 p-4 flex">
        <form
            class="w-full"
            on:submit|preventDefault={() => handleSubmit()}
        >
            <input type="text" class="flex items-center h-10 w-full rounded px-3 text-sm" bind:value={query}  placeholder="Type your message…"/>
        </form>
    </div>
</div>
<!-- Component End  -->

