<template>
    <br>
    <fieldset>
        <legend id = "title" class = "titles">Bills</legend>
        <br>
        <div id = "date-changer-container">
            <button class = "buttons date" id = "last-month" title = "watch the last month bill">last month</button>
            <p class = "date">February, 2025</p>
            <button class = "buttons date" id = "next-month" title = "watch the next month bill">next month</button>
        </div>
        <br>
        <table>
            <thead>
                <tr>
                    <th>item</th>
                    <th>price</th>
                    <th>date</th>
                </tr>
            </thead>
            <tbody v-for = "bill in bills" :key = "bill.id">
                <tr>
                    <td class = "hidden-rest" id = "item-container">
                        <div id = "item-text-container">
                            {{bill.item}}
                        </div>
                        <button class = "buttons bigger" id = "moreButton" @click = "toggleDropdown(bill.id)">more</button>
                        <div class = "dropdowns" v-if = "dropdownVisibility && selectedId === bill.id">
                            <button class = "buttons bigger" @click = "editBill(bill.id)" id = "changeButton"
                                    title = "edit the record">edit</button>
                            <button class = "buttons bigger" @click = "showDoubleCheck(bill.id)" id = "deleteButton"
                                    title = "delete the record">delete</button>
                        </div>
                    </td>
                    <td class = "hidden-rest">{{formatCurrency(bill.price)}}</td>
                    <td class = "hidden-rest">{{bill.date}}</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan = "1">you have <span id = "quantity">{{bills.length}}</span> record(s) in the page</td>
                    <td colspan = "2">you consumed <span id = "cost">{{formatCurrency(cost)}}</span> in the page</td>
                </tr>
            </tfoot>
        </table>
        <br>
        <div id = "page-changer-container">
            <button id = "prev" @click = "pageChange(-1)" :disabled = "count <= 1"
                    :class = "count <= 1 ? 'buttons-disabled' : 'buttons'" title = "watch the previous 10 records">
                previous</button>
            <p><span class = "pages">{{count}}</span> / <span class = "pages">{{page}}</span></p>
            <button id = "next" @click = "pageChange(1)" :disabled = "count >= page"
                    :class = "count >= page ? 'buttons-disabled' : 'buttons'" title = "watch the next 10 records">
                next</button>
        </div>
    </fieldset>
    <DeleteDoubleCheck ref = "deleteDoubleCheck" @confirm = "deleteBill(selectedId)"/>
</template>

<script>
    import BillService from "../services/BillService";
    import DeleteDoubleCheck from "../components/DeleteDoubleCheck.vue";

    export default{
        components:{
            DeleteDoubleCheck
        },
        data(){
            return{
                bills: [],
                page: 0,
                count: 1,
                cost: 0,
                selectedId: null,
                dropdownVisibility: false
            };
        },
        methods:{
            editBill(id){
                this.$router.push({name: 'EditBill', params: {id}});
            },
            deleteBill(id){
                BillService.deleteBill(id)
                            .then(() => {
                                this.cost = 0;
                                this.fetchBills();
                            });
            },
            fetchBills(){
                BillService.getBills()
                            .then(response => {
                                this.bills = response.data;
                                this.page = Math.ceil(this.bills.length / 10);
                            });
            },
            pageChange(number){
                this.count += number;
            },
            showDoubleCheck(id){
                this.toggleDropdown();
                this.$refs.deleteDoubleCheck.show();
                this.selectedId = id;
            },
            formatCurrency(price){
                return new Intl.NumberFormat("en-US",{
                    style: "currency",
                    currency: "USD",
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2,
                }).format(price);
            },
            toggleDropdown(id){
                this.dropdownVisibility = !this.dropdownVisibility;
                this.selectedId = id;
            }
        },
        watch:{
            bills(){
                console.log(`at the begining, the cost:\t${this.cost}\n`);
                for(let i = 0; i < this.bills.length; i++){
                    console.log(`#${i} bill price:\t${this.bills [i].price}\n`);
                    this.cost += this.bills [i].price * 100;
                }
                this.cost /= 100;
                console.log(`at the end, the cost:\t${this.cost}\n`);
            }
        },
        created(){
            this.fetchBills();
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

    .buttons{
        background-color: black;
        color: white;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        font-size: 18px;
        font-weight: 500;
        opacity: 75%;
        box-shadow: 1px 2px white, -1px -2px white;
        border-radius: 30px;
        padding: 5px 10px;
    }

    .buttons:hover{
        opacity: 100%;
        transition: all 0.25s ease-in;
        cursor: pointer;
    }

    .date{
        color: cyan;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 18px;
        font-weight: bolder;
    }

    table{
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        border: 1px solid cyan;
    }

    th,
    td{
        padding: 5px 10px;
        text-align: center;
        border: 1px solid white;
    }

    #item-container{
        display: flex;
        justify-content: space-between;
        justify-items: left;
        align-content: center;
        align-items: center;
        column-gap: 10px;
        padding: 5px 10px;
    }

    #item-text-container{
        text-align: center;
        width: 100%;
    }

    .dropdowns{
        position: absolute;
        left: 50%;
        background-color: rgba(128, 128, 128, 0.5);
        box-shadow: 2px 3px cyan, -2px -3px cyan;
        border: 1px solid white;
        border-radius: 30px;
        padding: 10px 20px;
        z-index: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        justify-items: center;
        align-content: center;
        align-items: center;
        row-gap: 10px;
    }

    #moreButton{
        color: cyan;
    }

    #changeButton{
        color: orange;
    }

    #deleteButton{
        color: red;
    }

    #quantity{
        color: cyan;
        font-weight: bolder;
    }
    
    #page-changer-container{
        display: flex;
        justify-content: space-between;
        justify-items: left;
        align-content: center;
        align-items: center;
        padding: 10px 50px;
    }

    #prev{
        color: yellow;
    }

    #next{
        color: green;
    }

    .pages{
        color: brown;
        font-size: 27px;
        font-weight: 500;
    }

    .buttons-disabled{
        background-color: gray;
        color: white;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        font-size: 18px;
        font-weight: 500;
        opacity: 75%;
        box-shadow: 1px 2px red, -1px -2px red;
        border-radius: 30px;
        padding: 5px 10px;
    }

    .buttons-disabled:hover{
        opacity: 50%;
        transition: all 0.25s ease-in;
        cursor: not-allowed;
    }

    #cost{
        color: orange;
    }
</style>