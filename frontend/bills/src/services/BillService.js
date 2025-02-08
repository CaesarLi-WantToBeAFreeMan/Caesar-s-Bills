import axios from "axios";
const API_URL = "http://localhost:1200/data/bills";
export default{
    getBills(){
        return axios.get(API_URL);
    },
    
    getBillById(id){
        return axios.get(`${API_URL}/${id}`);
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