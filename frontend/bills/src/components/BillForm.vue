<template>
    <div>
        <form>
            <fieldset>
                <legend class = "titles" id = "title">Bill Information</legend>
                <div class = "labels-inputs">
                    <label for = "item">Item:</label>
                    <input v-model = "bill.item" id = "item" type = "text" placeholder = "product name"
                            required>
                </div>
                
                <div class = "labels-inputs">
                    <label for = "price">Price:</label>
                    <input v-model = "bill.price" id = "price" type = "number" min = "0.00" value = "0.00"
                            step = 0.01 placeholder = "product price" required>
                </div>

                <div class = "labels-inputs">
                    <label for = "date">Date:</label>
                    <input v-model = "bill.date" id = "date" type = "date" required>
                </div>
                
                <button type = "submit" class = "bigger" @click.prevent = "submit">Create Bill</button>
            </fieldset>
        </form>
    </div>
    <BillEmpty ref = "billEmpty"/>
    <CreateSuccess ref = "createSuccess"/>
</template>

<script>
    import BillEmpty from "./BillEmpty.vue";
    import CreateSuccess from "./CreateSuccess.vue";
    export default{
        components:{
            BillEmpty,
            CreateSuccess
        },
        props:{
            billData:{
                type: Object,
                default: () => ({item: "", price: null, date: ""})
            }
        },
        data(){
            return{
                bill: this.billData
            };
        },
        methods:{
            submit(){
                if(this.check())
                    this.$refs.billEmpty.show();
                else{
                    this.$emit("submit", this.bill);
                    this.$refs.createSuccess.show();
                }
            },
            check(){
                return this.bill.item === "" || this.bill.price === null || this.bill.date === "";
            }
        }
    };
</script>

<style scoped>
    fieldset{
        display: grid;
        grid-template-rows: repeat(2, 1fr);
        grid-template-columns: repeat(2, 1fr);
        justify-content: start;
        justify-items: left;
        align-content: center;
        align-items: center;
        gap: 20px 30px;
        padding: 20px 10px;
    }

    #title{
        line-height: 50px;
        width: 12em;
    }

    .labels-inputs{
        display: flex;
        justify-content: start;
        justify-items: left;
        align-content: center;
        align-items: center;
        gap: 10px 20px;
    }

    input{
        background-color: black;
        color: white;
        caret-color: white;
        box-shadow: 2px 3px white, -2px -3px white;
        border: 1px solid cyan;
        border-radius: 50px;
        padding: 5px 10px;
    }

    input::placeholder{
        color: gray;
    }

    button{
        background-color: black;
        color: white;
        padding: 5px 10px;
        border: 1px solid cyan;
        border-radius: 30px;
        box-shadow: 2px 3px white, -2px -3px white;
    }
</style>