<script lang="ts">
    import MessageAvatar from './MessageAvatar.svelte';

    import MessageTimer from './MessageTimer.svelte';

    import type { ChatCompletionRequestMessageRoleEnum } from 'openai'

    export let type: ChatCompletionRequestMessageRoleEnum
    export let message: string
</script>

<div class="flex w-full mt-2 space-x-3 max-w-xs {type === 'user' ? 'ml-auto justify-end' : ''}">
    {#if type === 'assistant'}
        <MessageAvatar />
    {/if}
    <div>
        <div class="{type === 'user' ? 'bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg' : 'bg-gray-300 p-3 rounded-r-lg rounded-bl-lg'}">
            <p class="text-sm">{message}</p>
        </div>
        <MessageTimer />
    </div>
    {#if type === 'user'}
        <MessageAvatar />
    {/if}
</div>
