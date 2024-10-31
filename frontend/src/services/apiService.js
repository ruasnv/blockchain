import axios from 'axios';

const API_URL = 'http://localhost:5000'; // Update with your backend URL

export const submitJob = async (jobData) => {
    return await axios.post(`${API_URL}/jobs/submit`, jobData);
};

// Add more API calls as needed
