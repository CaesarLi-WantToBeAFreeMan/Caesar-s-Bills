<template>
    <h1 class = "titles">Bills List</h1>
    <fieldset>
        <legend id = "title" class = "titles">Bills</legend>
        <br>
        <div id = "date-changer-container">
            <button class = "buttons date" id = "yesterday" title = "watch the last month bill"
                    @click = "switchYesterday">yesterday</button>
            <p class = "date">{{dateString}}</p>
            <button class = "buttons date" id = "tomorrow" title = "watch the next month bill"
                    @click = "switchTomorrow">tomorrow</button>
        </div>
        <BillList ref = "billList" :date = "date"/>
    </fieldset>
</template>

<script>
    import BillList from "../components/BillList.vue";

    export default{
        name: "BillListView",
        components: {
            BillList
        },
        data(){
            return{
                date: null,
                dateString: "",
                dateObject: null
            };
        },
        methods:{
            getDateString(date){
                let monthNames = [
                    "January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"
                ];
                return `${monthNames [date.getMonth()]} ${date.getDate()}, ${date.getFullYear()}`;
            },
            switchYesterday(){
                this.dateObject.setDate(this.dateObject.getDate() - 1);
                this.date = this.dateObject.toISOString().split("T")[0];
                this.dateString = this.getDateString(this.dateObject);
                this.$refs.billList.refresh(this.date);
            },
            switchTomorrow(){
                this.dateObject.setDate(this.dateObject.getDate() + 1);
                this.date = this.dateObject.toISOString().split("T")[0];
                this.dateString = this.getDateString(this.dateObject);
                this.$refs.billList.refresh(this.date);
            }
        },
        created(){
            this.dateObject = new Date();
            this.date = this.dateObject.toISOString().split("T")[0];
            this.dateString = this.getDateString(this.dateObject);
        }
    };
</script>

<style scoped>
    #title{
        line-height: 50px;
        width: 3em;
    }

    #date-changer-container{
        display: flex;
        justify-content: space-between;
        justify-items: left;
        align-content: center;
        align-items: center;
        padding: 5px 30px;
    }

    .date{
        color: cyan;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 18px;
        font-weight: bolder;
    }
</style>