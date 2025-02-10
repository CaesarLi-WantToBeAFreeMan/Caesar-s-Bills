<template>
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
                    <button class = "bigger" id = "moreButton" @click = "toggleDropdown(bill.id)">...</button>
                    <div class = "dropdowns" v-if = "dropdownVisibility && selectedId === bill.id">
                        <button class = "buttons bigger" @click = "showEditBill(bill.id)" id = "changeButton"
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
                <td colspan = "1">you have <span id = "quantity">{{recordNumber}}</span> record(s) today</td>
                <td colspan = "2">you consumed <span id = "cost">{{formatCurrency(cost)}}</span> today</td>
            </tr>
        </tfoot>
    </table>
    <br>
    <div id = "page-changer-container">
        <button id = "prev" @click = "pageChange(-1)" :disabled = "count <= 1"
                :class = "count <= 1 ? 'buttons-disabled' : 'buttons'" title = "watch the previous 10 records">
            previous</button>
        <p><span class = "pages">{{page}}</span> / <span class = "pages">{{count}}</span></p>
        <button id = "next" @click = "pageChange(1)" :disabled = "count >= page"
                :class = "count >= page ? 'buttons-disabled' : 'buttons'" title = "watch the next 10 records">
            next</button>
    </div>
    <DeleteDoubleCheck ref = "deleteDoubleCheck" @confirm = "deleteBill"/>
    <BillEdit ref = "billEdit" :bill = "bill" @edit = "editBill"/>
</template>

<script>
    import BillService from "../services/BillService";
    import DeleteDoubleCheck from "./DeleteDoubleCheck.vue";
    import BillEdit from "./BillEdit.vue";

    export default{
        name: "BillList",
        components:{
            DeleteDoubleCheck,
            BillEdit
        },
        props: {
            date: {
                type: String,
                required: true
            }
        },
        data(){
            return{
                bills: [],
                page: 1,
                count: 1,
                cost: 0,
                selectedId: null,
                dropdownVisibility: false,
                bill: {item: "", price: null, date: ""},
                recordNumber: null
            };
        },
        methods:{
            editBill(bill){
                delete this.bill.id;
                BillService.updateBill(this.selectedId, bill)
                            .then(() => this.fetchBills());
            },
            deleteBill(){
                BillService.deleteBill(this.selectedId)
                            .then(() => {
                                this.calculateCost();
                                this.fetchBills();
                            });
            },
            fetchBills(date){
                BillService.getBillsByDate(date)
                            .then(response => {
                                this.bills = response.data;
                                this.calculateCost();
                                this.countPage();
                            });
            },
            getRecordNumber(date){
                BillService.countByDate(date)
                            .then(response => {
                                this.recordNumber = response.data;
                                this.countPage();
                            });
            },
            countPage(){
                this.count = this.recordNumber === 0 ? 1
                                                     : Math.ceil(this.recordNumber / 10);
            },
            pageChange(number){
                this.page += number;
            },
            showDoubleCheck(id){
                this.toggleDropdown(id);
                this.$refs.deleteDoubleCheck.show();
                this.selectedId = id;
            },
            showEditBill(id){
                this.toggleDropdown(id);
                this.bill = this.bills.find(bill => bill.id === id);
                this.$refs.billEdit.show();
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
            },
            calculateCost(){
                this.cost = 0;
                for(let i = 0; i < this.bills.length; i++)
                    this.cost += this.bills [i].price * 100;
                this.cost /= 100;
            },
            refresh(date){
                this.fetchBills(date);
                this.getRecordNumber(date);
                this.page = 1;
            }
        },
        watch:{
            bills(){
                this.calculateCost();
            },
            recordNumber(){
                this.countPage();
            }
        },
        created(){
            this.refresh(this.date);
        }
    };
</script>

<style>
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
        background-color: black;
        border: none;
        font-weight: 900;
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