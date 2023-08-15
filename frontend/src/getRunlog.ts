import { ApolloClient, InMemoryCache, gql } from "@apollo/client/core";

const client = new ApolloClient({
    uri: 'http://localhost:3000/graphql',
    cache: new InMemoryCache(),
});

export const getData = () => {
    client.query({
        query: gql`
        {
            runlogs {
                id
                distance
            }
        }
        `,
    })
    .then((result) => console.log(result));
}
