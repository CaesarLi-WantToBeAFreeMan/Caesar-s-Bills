<template>
    <div v-if = "visibility" class = "overlay" @click = "reload">
        <div class = "pop" @click.stop>
            <h1 class = "corrects">You Have Created A Bill Successfully</h1>
            <h1 class = "warnings">Please Decide:</h1>
            <div id = "choices-container">
                <button class = "buttons bigger" @click = "list">Bill List</button>
                <button class = "buttons bigger" @click = "reload">Create Again</button>
            </div>
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
            list(){
                this.$router.push({name: "billList"});
            },
            reload(){
                window.location.reload();
            }
        }
    };
</script>

<style scoped>
    #choices-container{
        display: flex;
        justify-content: space-around;
        justify-items: left;
        align-content: center;
        align-items: center;
        padding: 10px 30px;
        gap: 5px 30px;
        margin: 5px auto 10px auto;
    }

    .buttons{
        background-color: black;
        color: white;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 21px;
        font-weight: light;
        padding: 5px 10px;
        border: 1px solid cyan;
        border-radius: 50px;
        width: 7em;
    }
</style>