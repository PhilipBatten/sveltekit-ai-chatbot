<script lang="ts">
    export let varient:string = ''
    export let content:string = ''
</script>

{#if varient === 'assistant'}
<div class="flex w-full mt-2 space-x-3 max-w-xs">
    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
    <div>
        <div class="bg-gray-300 p-3 rounded-r-lg rounded-bl-lg">
            <p class="text-sm">{content}</p>
        </div>
        <!-- <span class="text-xs text-gray-500 leading-none">2 min ago</span> -->
    </div>
</div>
{:else}
<div class="flex w-full mt-2 space-x-3 max-w-xs ml-auto justify-end">
    <div>
        <div class="bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg">
            <p class="text-sm">{content}</p>
        </div>
        <!-- <span class="text-xs text-gray-500 leading-none">2 min ago</span> -->
    </div>
    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
</div>
{/if}