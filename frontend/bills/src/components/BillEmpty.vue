<template>
    <div v-if = "visibility" class = "overlay" @click = "close">
        <div class = "pop" @click.stop>
            <h1 class = "errors">Your Bill That You Wanted Is Empty</h1>
            <h1 class = "errors">Please Fill The Bill</h1>
            <h1 class = "warnings">Please Click Anywhere Outside To Close</h1>
        </div>
    </div>
</template>

<script>
    export default{
        data(){
            return{
                visibility: false
            };
        },
        methods:{
            show(){
                this.visibility = true;
            },
            close(){
                this.visibility = false;
            }
        }
    };
</script>