<script lang="ts">
	import type { ChatCompletionRequestMessageRoleEnum } from 'openai'
	export let type: ChatCompletionRequestMessageRoleEnum
	export let message: string
    // export let initials: string = 'PB'
</script>

{#if type === 'assistant'}
    <div class="flex w-full mt-2 space-x-3 max-w-xs">
        <div class="flex-shrink-0 relative inline-flex items-center justify-center w-10 h-10 overflow-hidden bg-gray-200 rounded-full dark:bg-gray-600">
            <span class="font-medium text-gray-600 dark:text-gray-300"></span>
        </div>
        <div>
            <div class="bg-gray-300 p-3 rounded-r-lg rounded-bl-lg">
                <p class="text-sm">{message}</p>
            </div>
            <!-- <span class="text-xs text-gray-500 leading-none">2 min ago</span> -->
        </div>
    </div>
{:else}
    <div class="flex w-full mt-2 space-x-3 max-w-xs ml-auto justify-end">
        <div>
            <div class="bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg">
                <p class="text-sm">{message}</p>
            </div>
            <!-- <span class="text-xs text-gray-500 leading-none">2 min ago</span> -->
        </div>
        <div class="flex-shrink-0 relative inline-flex items-center justify-center w-10 h-10 overflow-hidden bg-gray-200 rounded-full dark:bg-gray-600">
            <span class="font-medium text-gray-600 dark:text-gray-300"></span>
        </div>
    </div>
{/if}