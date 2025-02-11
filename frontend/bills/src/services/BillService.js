import axios from "axios";
const API_URL = "http://localhost:1200/data/bills";
export default{
    getBills(date){
        return axios.get(API_URL, {params: {date: date}});
    },
    
    getBillById(id){
        return axios.get(`${API_URL}/${id}`);
    },

    getBillsByDate(date, page, size){
        return axios.get(`${API_URL}/date`, {params: {date: date, page: page - 1, size: size}});
    },

    countByDate(date){
        return axios.get(`${API_URL}/countByDate`, {params: {date: date}});
    },

    getTotalCostByDate(date){
        return axios.get(`${API_URL}/totalCost`, {params: {date: date}});
    },
    
    createBill(bill){
        return axios.post(API_URL, bill);
    },
    
    updateBill(id, bill){
        return axios.put(`${API_URL}/${id}`, bill);
    },
    
    deleteBill(id){
        return axios.delete(`${API_URL}/${id}`);
    }
};