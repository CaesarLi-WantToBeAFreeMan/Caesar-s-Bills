<template>
    <div v-if = "visibility" class = "overlay" @click = "close">
        <div class = "pop" @click.stop>
            <fieldset>
                <legend class = "titles">Update The Bill</legend>
                <div class = "labels-inputs">
                    <label for = "item">item: </label>
                    <input id = "item" v-model = "bill.item">
                </div>
                <div class = "labels-inputs">
                    <label for = "price">price: </label>
                    <input id = "price" v-model = "bill.price">
                </div>
            </fieldset>
            <div id = "choices-container">
                <button class = "buttons bigger" id = "edit-button" @click = "edit">edit</button>
                <button class = "buttons bigger" @click = "close">cancel</button>
            </div>
        </div>
    </div>
</template>

<script>
    export default{
        name: "BillEdit",
        props: {
            bill: {
                type: Object,
                required: true
            }
        },
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
            },
            edit(){
                this.$emit("edit", this.bill);
                this.close();
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

    #edit-button{
        background-color: red;
    }

    fieldset{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: 1fr;
        padding: 5px 10px;
        column-gap: 10px;
        justify-content: space-between;
        justify-items: center;
        align-content: center;
        align-items: center;
    }

    .labels-inputs{
        color: white;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 15px;
        font-weight: light;
        margin: 10px auto;
    }

    input{
        background-color: black;
        color: white;
        caret-color: white;
        box-shadow: 1px 2px white, -1px -2px white;
        border: 1px solid cyan;
        padding: 5px 10px;
        border-radius: 30px;
    }

    input:placeholder{
        color: gray;
    }
</style>