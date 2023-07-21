const axios = require("axios").default;

const http = axios.create({
  baseURL: "https://randomuser.me/api/",
});

module.exports.getUsers = async () => {
  const { data: { results } } = await http.get('?results=300&seed=postgessDB&page=1');
  return results;
};
