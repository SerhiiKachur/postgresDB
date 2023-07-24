const axios = require("axios").default;
const { results, seed} = require('../configs/api.json');

const http = axios.create({
  baseURL: "https://randomuser.me/api/",
});

module.exports.getUsers = async () => {
  const { data: { results:users} } = await http.get(`?results=${results}&seed=${seed}&page=1`);
  return users;
};
