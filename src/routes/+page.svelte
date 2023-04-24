<script lang="ts">
	import Message from "../components/message.svelte";

    type MessageType = {
        varient: string,
        content: string
    }

    let messages: Array<MessageType> = [
        {varient: 'assistant', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'},
        {varient: 'user', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'},
    ]

    let input = ''

    const handleSubmit = async () => {
        messages.push({varient: 'user', content: input})
        messages = messages
        input = ''
    }
</script>
<body class="flex flex-col items-center justify-center w-screen min-h-screen bg-gray-100 text-gray-800 p-10">

	<!-- Component Start -->
	<div class="flex flex-col flex-grow w-full max-w-xl bg-white shadow-xl rounded-lg overflow-hidden">
		<div class="flex flex-col flex-grow h-0 p-4 overflow-auto">
            {#each messages as message}
                <Message varient='{message.varient}' content='{message.content}'/>
            {/each}
		</div>
		
		<div class="bg-gray-300 p-4 flex">
            <form
                class="w-full"
                on:submit|preventDefault={() => handleSubmit()}
            >
                <input type="text" class="flex items-center h-10 w-full rounded px-3 text-sm" bind:value={input}  placeholder="Type your message…"/>
            </form>
			<!-- <input bind:value={input} class="flex items-center h-10 w-full rounded px-3 text-sm" type="text" placeholder="Type your message…"> -->
            <!-- <button type='button' on:click={() => handleSubmit} class="">submit</button> -->
		</div>
	</div>
	<!-- Component End  -->

</body>